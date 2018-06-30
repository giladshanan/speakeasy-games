class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game
  before_action :host_only

  def index; end

  def invite
    invite_params[:assignments].each do |character_id, email|
      User.invite!(email: email, characters: [Character.find(character_id)]) if email
    end
    redirect_to game_characters_path(@game)
  end

  private

  # TODO- make this clearer and stronger
  def host_only
    unless current_user.games.include?(@game)
      redirect_to root_path, :alert => "Access denied."
    end
  end

  def find_game
    @game = Game.find(params[:game_id])
  end

  def invite_params
    params.require(:invites).permit(assignments: {})
  end

end
