class CoverPhotosController < ApplicationController
  def destroy
    @cover_photo = CoverPhoto.find( params[:id] )
    @game = @cover_photo.game
    @cover_photo.img = nil
    @cover_photo.save
    @cover_photo.destroy
    redirect_to edit_game_path(@game)
  end
end
