class ChargesController < ApplicationController
  def new
  end

  def create
    @user = current_user
    @order = @user.orders.where(complete:false)[0]

    # Amount in cents
    @amount = @order.total

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Speakeasy Games customer',
      :currency    => 'usd'
    )

    @order.update(complete:true)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
