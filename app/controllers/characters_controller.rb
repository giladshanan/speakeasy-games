class CharactersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_game
  before_action :host_only

  def index; end

  def invite
    emails = []
    invite_params[:assignments].each do |character_id, email|
      if email.size.positive?
        character = Character.find(character_id)
        user = User.find_by(email: email)
        if user && ( !user.created_by_invite? || user.invitation_accepted? )
          # devise_inviteable assigns attributes to existing records with
          # associations, so we want to handle these emails ourselves
          # https://github.com/scambra/devise_invitable/issues/747
          user.characters << character
          UserMailer.character_email(user, current_user, @game, character).deliver_later
        else
          user = User.invite!({email: email, characters: [character]}, current_user)
        end
        emails << "#{character.name} (#{email})" if user.errors.empty?
      end
    end
    flash[:error] = "Invitations have been sent to: #{emails.to_sentence}." unless emails.empty?
    redirect_to game_characters_path(@game)
  end

  private

  # how do you know who the host is?
  # how do you know you have the right order?
  # dont use orders as a join table for characters and users

  # def existing_user?(email)
  #   return true if User.find_by(email: email)
  # end

  # def find_user
  #   @user = User.find_by(email: email)
  #   @user.present? ? @user : User.invite!(email: email)
  # end

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
