class OrdersController < ApplicationController
  def create
    @inquiry = Inquiry.find(params[:inquiry_id])
    order  = Order.create!(inquiry_id: @inquiry.id, amount: @inquiry.price, state: 'pending')

    redirect_to new_order_payment_path(order)
  end

  def show
    @order = Order.where(state: 'paid').find(params[:id])
  end
end
