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
        code: "10762801815",
        )
    end
    redirect_to countdown_path(@countdown), alert: @alert
  end

  def show
    @countdown = Countdown.find(params[:id])
    #TODO if the correct answer is guessed before time runs out, the timer will show 0 time left but you still cannot start a new timer until the time is up
    #TODO what if the timer runs out while on lockdown?
    #TODO refactor lockdowns into seperate object

    # ask John:
    # flashing 2 min warning
    # different color?
    grace_period = 120 # seconds
    if @countdown.seconds != 0 && @countdown.lockout_remaining > 0 && @countdown.time_remaining > grace_period
      if @countdown.lockout_remaining > @countdown.time_remaining - grace_period
        @countdown.seconds = @countdown.time_remaining - grace_period
      else
        @countdown.seconds = @countdown.lockout_remaining
      end
    elsif @countdown.seconds != 0
      @countdown.seconds = @countdown.time_remaining
    end
    @countdown.save
    if @countdown.time_remaining < grace_period && @countdown.time_remaining > 0
      flash.now[:alert] = "Time is almost up!"
    elsif @countdown.lockout_remaining > 0 && @countdown.time_remaining > 0
      flash.now[:alert] = "Incorrect Code. System Locked."
    end
    render layout: false
  end

  def search
    @countdown = Countdown.find(params[:id])
    if params[:q] == @countdown.code
      @countdown.seconds = 0
      @countdown.save
      @alert = "Correct!"
      redirect_to countdowns_path, alert: @alert
    else
      @countdown.guesses += 1
      @countdown.lockout_seconds *= @countdown.lockout_increment
      @countdown.lockout_started_at = Time.current
      @countdown.save
      @alert = "Incorrect Code. System Locked."
      redirect_to countdown_path(@countdown), alert: @alert
    end
  end

  def index
    render layout: false
  end
end
