class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game
  before_action :host_only#, :except => [:show, :edit, :update]

  def index
    # @order = 
  end

  def invite
    invite_params.each do |character_id, email|
      new_user = User.create(email: email, password: temp?)
      new_user.characters << Character.find(character_id)
      new_user.games << @game
      # send invitation
    end
  end

  private

  def host_only
    unless current_user.games.include?(@game)
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def find_game
    @game = Game.find(params[:game_id])
  end

  def invite_params
    params.require(:invites).permit(:assignments)
  end

end
