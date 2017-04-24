class PaymentsController < ApplicationController
  before_action :set_order, only: [:new, :create]

  def new
  end

  def create
    unless current_user.stripe_customer_id
      customer = Stripe::Customer.create(
        source: params[:stripeToken],
        email:  params[:stripeEmail]
      )
      # current_user.stripe_customer_id = customer.id
    end

    charge = Stripe::Charge.create(
      customer:     customer.id,   # You should store this customer id and re-use it.
      amount:       @order.amount_cents, # or amount_pennies
      description:  "Payment for request # #{@order.inquiry_id} for order #{@order.id}",
      currency:     @order.amount.currency
    )

    @order.update(payment: charge.to_json, state: 'paid')
    redirect_to order_path(@order)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_order_payment_path(@order)
    end


  private
  def set_order
    @order = Order.where(state: 'pending').find(params[:order_id])
  end
end
