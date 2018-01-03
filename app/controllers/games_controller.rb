class GamesController < ApplicationController

  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
  end

  def edit
    @game = Game.find(params[:id])
  end

  def update
    @game = Game.find( params[:id] )
    params[:game][:images].each { |image| @game.photos.create(img: image) }
    @game.save
    # @game.update( game_params )
    redirect_to game_path(@game)
  end

  private

  def game_params
    params.require(:game).permit(:images)
  end
end
