class PaymentsController < ApplicationController
  before_action :set_inquiry, only: [:new, :create]

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
      amount:       @inquiry.price_cents, # or amount_pennies
      description:  "Payment for request # #{@inquiry.id}",
      currency:     @inquiry.price.currency
    )

    @inquiry.update(payment: charge.to_json, status: 'accepted')
    redirect_to inquiry_path(@inquiry)

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to inquiry_path(@inquiry)
    end


  private
  def set_inquiry
    @inquiry = Inquiry.where(status: 'proposed').find(params[:inquiry_id])
  end
end
