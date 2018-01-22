class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def create
    if !current_user
      flash[:alert] = "Please log in to add items to your cart."
      redirect_to new_user_session_path and return
    end
    @game = Game.find(params[:game_id])
    @user = current_user
    @order = @user.orders.where(complete: false).last || Order.create(complete: false, user: @user)
    @purchased_game = PurchasedGame.find_by(game: @game, order: @order) || PurchasedGame.create(game: @game, order: @order, quantity: 0)
    @purchased_game.update_quantity
    @purchased_game.update_subtotal
    @purchased_game.save
    redirect_to order_path(@order)
  end
end
