class GamesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :admin_only, except: [:index, :show]

  def index
    @user = current_user || User.new
    # @order = @user.orders.where(complete: false) || Order.create(complete: false)
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
    @game.packet = params[:game][:packet] if params[:game][:packet]
    params[:game][:images].each { |image| @game.photos.create(img: image) } if params[:game][:images]
    if params[:game][:cover_photo]
      @game.cover_photo.destroy if @game.cover_photo
      CoverPhoto.create(img: params[:game][:cover_photo], game: @game)
    end
    @game.save
    redirect_to game_path(@game)
  end

  def destroy
    @game = Game.find( params[:id] )
    @game.destroy
    redirect_to root_path
  end

  private

  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def game_params
    params.require(:game).permit(:images, :title, :teaser, :included, :not_included, :difficulty, :price, :notes, :packet)
  end
end
