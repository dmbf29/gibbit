class InquiriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]

  def index
    @inquiries = current_user.inquiries
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @messages = Message.where(inquiry_id: 1)
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.status = "pending"
    if @inquiry.save
      redirect_to inquiry_path(@inquiry)
    else
      render 'inquiries/new'
    end
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    @inquiry.destroy
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:first_name, :email, :description, :photo, :photo_cache)
  end

end
