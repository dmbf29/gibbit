class Gibbers::InquiriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_gibber!
  # user should not be authorized to check this page
  before_action :set_inquiry, only: [:propose, :pending, :complete, :assign_gibber]

  def index
    @inquiries = Inquiry.all
    @empties = Inquiry.where(gibber_id: nil)
    @pendings = Inquiry.where(status: "pending").where.not(gibber: nil)
    @proposals = Inquiry.where(status: "proposed")
    @acceptions = Inquiry.where(status: "accepted")
    @rejections = Inquiry.where(status: "rejected")
    @completions = Inquiry.where(status: "completed")
    @gibbers = Gibber.all
    @gibber = current_gibber
    # binding.pry
    @message = Message.new
  end

  def propose
    @inquiry.status = "proposed"
    @inquiry.gibber = current_gibber
    @inquiry.save
    # @order = Order.create!(inquiry_id: @inquiry.id, amount: @inquiry.price, state: 'pending')
    Notice.create(user: @inquiry.user, gibber: @inquiry.gibber, action: "sent a proposal", notifiable: @inquiry)
    redirect_to inquiry_path(@inquiry)
  end

  def pending
    @inquiry.status = "pending"
    @inquiry.save
    redirect_to :back
  end

  def complete
    @inquiry.status = "completed"
    @inquiry.save
    redirect_to :back
  end

  def assign_gibber
    @gibber = Gibber.find(params[:gibber][:id])
    @inquiry.gibber = @gibber
    @inquiry.save

    redirect_to :back
  end

  private

  def set_inquiry
    @inquiry = Inquiry.find(params[:id])
  end

end
