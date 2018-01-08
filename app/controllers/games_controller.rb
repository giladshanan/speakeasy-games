class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @games = Game.all
  end

  def show
    @games = Game.all
    @game = Game.find(params[:id])
  end

  def edit
    @games = Game.all
    @game = Game.find(params[:id])
  end

  def update
    @games = Game.all
    @game = Game.find( params[:id] )
    @game.update( game_params )
    params[:game][:images].each { |image| @game.photos.create(img: image) } if params[:game][:images]
    if params[:game][:cover_photo]
      @game.cover_photo.destroy if @game.cover_photo
      CoverPhoto.create(img: params[:game][:cover_photo], game: @game)
    end
    @game.save
    redirect_to game_path(@game)
  end

  def destroy
    @games = Game.all
    @game = Game.find( params[:id] )
    @game.destroy
    redirect_to root_path
  end

  private

  def game_params
    params.require(:game).permit(:images, :title, :teaser, :included, :not_included, :difficulty, :price, :notes) #, :cover_photo)
  end
end
