class CountdownsController < ApplicationController

  def new

    render layout: false
  end

  def create
    @purchased_game = PurchasedGame.first
    # @purchased_game = PurchasedGame.find(params[:purchased_game_id])
    @countdown = Countdown.create(
      purchased_game: @purchased_game,
      total_time: 3,
      initial_lockout: 5,
      lockout_increment: 5,
      guesses: 0,
      code: "testingthecode",
      )

    redirect_to countdown_path(@countdown)
  end

  def show
    @countdown = Countdown.find(params[:id])
    @countdown.seconds = @countdown.time_remaining
    @countdown.save
    render layout: false
  end
end
