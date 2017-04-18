class OrdersController < ApplicationController
    before_action :set_order, only: [:index]

    def index
      @orders = current_user.orders
    end

    private
    def set_order
      @order = Inquiry.find(params[:id])
    end

end
