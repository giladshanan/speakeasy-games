class TestimonialsController < ApplicationController
  def destroy
    @testimonial = Testimonial.find( params[:id] )
    @game = @testimonial.game
    @testimonial.destroy
    redirect_to edit_game_path(@game)
  end
end
