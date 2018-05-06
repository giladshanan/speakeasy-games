class CountdownsController < ApplicationController

  def create
    @purchased_game = PurchasedGame.find(params[:purchased_game_id])
    if @purchased_game.countdown.present? && @purchased_game.countdown.time_remaining > 1
      @countdown = @purchased_game.countdown
      @alert = "You already have a countdown started."
    else
      @purchased_game.countdown.destroy! if @purchased_game.countdown.present?
      @countdown = Countdown.create(
        purchased_game: @purchased_game,
        total_time: 3*3600, # in seconds
        lockout_seconds: 60, # half the initial lockout time, in seconds
        lockout_increment: 2, # coefficient for incrementing
        guesses: 0,
        disarm_code: "10762801815",
        launch_code: "12636956321",
        active: true,
        )
    end
    redirect_to countdown_path(@countdown), alert: @alert
  end

  def show
    @countdown = Countdown.find(params[:id])
    grace_period = 120 # seconds
    if @countdown.seconds == 0
      if @countdown.active == true
        render layout: false
      else
        @alert = "Disarm Code Verified."
        redirect_to "/countdowns/#{@countdown.id}/ending", alert: @alert
      end
    else
      if @countdown.lockout_remaining > 0 && @countdown.time_remaining > grace_period
        if @countdown.lockout_remaining > @countdown.time_remaining - grace_period
          @countdown.seconds = @countdown.time_remaining - grace_period
        else
          @countdown.seconds = @countdown.lockout_remaining
        end
      else
        @countdown.seconds = @countdown.time_remaining
      end

      @countdown.save

      if @countdown.time_remaining < grace_period && @countdown.time_remaining > 0
        flash.now[:alert] = "Launch Imminent!"
      elsif @countdown.lockout_remaining > 0 && @countdown.time_remaining > 0
        flash.now[:alert] = "Incorrect Disarm Code. System Locked."
      end
      render layout: false
    end
  end

  def search
    @countdown = Countdown.find(params[:id])
    if params[:q] == @countdown.disarm_code && @countdown.active == true
      @countdown.seconds = 0
      @countdown.pause_started_at = Time.current
      @countdown.active = false
      @countdown.save
      @alert = "Disarm Code Verified."
      redirect_to "/countdowns/#{@countdown.id}/ending", alert: @alert
    elsif params[:q] == @countdown.launch_code && @countdown.active == false
      render partial: 'confirm'
    elsif @countdown.active == false
      @alert = "Incorrect Launch Code."
      redirect_to "/countdowns/#{@countdown.id}/ending", alert: @alert
    else
      @countdown.guesses += 1
      @countdown.lockout_seconds *= @countdown.lockout_increment
      @countdown.lockout_started_at = Time.current
      @countdown.save
      @alert = "Incorrect Code. System Locked."
      redirect_to countdown_path(@countdown), alert: @alert
    end
  end

  def ending
    @countdown = Countdown.find(params[:id])

    if @countdown.active == true
      redirect_to countdown_path(@countdown)
    elsif params[:launch] == @countdown.launch_code
      @countdown.pause_ended_at = Time.current
      @countdown.total_time += @countdown.pause_duration
      @countdown.seconds = @countdown.time_remaining
      @countdown.active = true
      @countdown.save
      @alert = "Launch Code Verified. Countdown Resumed."
      redirect_to countdown_path(@countdown), alert: @alert
    else
      @alert = "Countdown Paused."
      render layout: false, alert: @alert
    end
  end

  def index
    redirect_to user_path(current_user)
  end
end
