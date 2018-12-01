class UserMailer < ApplicationMailer
  default from: 'playspeakeasygames@gmail.com'

  def welcome_email(user, order)
    @user = user
    @order = order
    # @games = @order.games.pluck(:title)
    # attachments['SilverGrass.zip'] = File.read('public/SilverGrass.zip')
    mail(to: @user.email, subject: 'Your Recent Order From Speakeasy Games!')
  end

  def character_email(user, inviter, game, character)
    @user = user
    @game = game
    @inviter = inviter
    @character = character
    mail(to: @user.email, subject: "Your Invitation from Speakeasy Games")
  end
end
