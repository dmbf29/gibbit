class OrdersController < ApplicationController
    before_action :authenticate_gibber!

    def index
      @orders = Inquiry.all
    end

    # private
    # def set_order
    #   @order = Inquiry.find(params[:id])
    # end

end
