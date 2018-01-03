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
    @game.update( game_params )
    params[:game][:images].each { |image| @game.photos.create(img: image) } if params[:game][:images]
    @game.save
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find( params[:id] )
    @game.destroy
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:images, :title, :teaser, :included, :not_included, :difficulty, :price)
  end
end
