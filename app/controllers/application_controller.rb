class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_games

  def set_games
    @games = Game.order(:id)
  end

end
