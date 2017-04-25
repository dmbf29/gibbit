class InquiriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :show ]
  before_action :set_user, only: [:new, :create, :show, :index]
  before_action :set_inquiry, only: [:accept, :reject, :add_review]

  def index
    @inquiries = current_user.inquiries
    @pendings = @inquiries.where(status: "pending")
    @proposals = @inquiries.where(status: "proposed")
    @acceptions = @inquiries.where(status: "accepted")
    @rejections = @inquiries.where(status: "rejected")
    @completions = @inquiries.where(status: "completed")
    @inquiry = Inquiry.new
  end

  def show
    @inquiry = Inquiry.find(params[:id])
    @messages = Message.where(inquiry: @inquiry)
    @message = Message.new
  end

  def accept
    @inquiry.status = "accepted"
    @inquiry.save
    redirect_to :back
  end

  def reject
    @inquiry.status = "rejected"
    @inquiry.save
    redirect_to :back
  end

  def add_review
    @inquiry.rating = params["inquiry"]["rating"]
    @inquiry.review = params["inquiry"]["review"]
    @inquiry.save
    redirect_to inquiry_path(@inquiry)
  end

  def new
    @inquiry = Inquiry.new
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    @inquiry.user = @user
    if @inquiry.save
      # InquiryMailer.creation_confirmation(@inquiry).deliver_now
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
    params.require(:inquiry).permit(:description, :photo, :photo_cache)
  end

  def set_user
    current_user.nil? ? @gibber = current_gibber : @user = current_user
  end

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end
end
