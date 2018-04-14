class CountdownsController < ApplicationController

  def create
    @purchased_game = PurchasedGame.find(params[:purchased_game_id])
    if @purchased_game.countdown.present?
      @countdown = @purchased_game.countdown
      @alert = "You already have a countdown started."
    else
      @countdown = Countdown.create(
        purchased_game: @purchased_game,
        total_time: 3,
        initial_lockout: 5,
        lockout_increment: 5,
        guesses: 0,
        code: "testingthecode",
        )
      @alert = nil
    end
    redirect_to countdown_path(@countdown), alert: @alert
  end

  def show
    @countdown = Countdown.find(params[:id])
    @countdown.seconds = @countdown.time_remaining
    @countdown.save
    render layout: false
  end

  def search
    @countdown = Countdown.find(params[:id])
    @alert = "Correct!" if params[:q] == @countdown.code
    redirect_to countdown_path(@countdown), alert: @alert

  end
end
