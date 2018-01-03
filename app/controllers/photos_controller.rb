class PhotosController < ApplicationController

  def index
    # @games = Game.all
  end

  def show
    # @game = Game.find(params[:id])
  end

  def edit
    # @game = Game.find(params[:id])
  end

  def destroy
    @photo = Photo.find( params[:id] )
    @game = @photo.game
    @photo.img = nil
    @photo.save
    @photo.destroy
    redirect_to edit_game_path(@game)
  end
end
