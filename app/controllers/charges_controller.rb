class ChargesController < ApplicationController
  def new
  end

  def create
    @games = Game.all
    @user = current_user
    @order = @user.orders.where(complete:false)[0]

    # Amount in cents
    @amount = @order.total

    customer = Stripe::Customer.create(
      :email   => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer      => customer.id,
      :amount        => @amount,
      :description   => 'Speakeasy Games',
      :statement_descriptor => @order.total_games,
      :receipt_email => customer.email,
      :currency      => 'usd'
    )

    if charge["paid"] == true
      @order.update(complete:true)
      UserMailer.welcome_email(@user, @order).deliver_later
    end

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
  end
end
