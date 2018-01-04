class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find( params[:id] )
    @game = @photo.game
    @photo.img = nil
    @photo.save
    @photo.destroy
    redirect_to edit_game_path(@game)
  end
end
