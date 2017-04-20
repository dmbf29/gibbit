class MessagesController < ApplicationController
  before_action :set_sender, only: [:create]
  skip_before_action :authenticate_user!

  def create
    @inquiry = Inquiry.find(params[:inquiry_id])
    @message = Message.new(message_params)
    @message.inquiry = @inquiry
    @message.sender = @sender
    if @sender == current_gibber && @inquiry.status == "pending"
      @inquiry.status = "proposed"
      @inquiry.save
    end
    if @message.save
      redirect_to inquiry_path(@inquiry)
    else
      render 'inquiries/show'
      # need to check
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_sender
    current_user.nil? ? @sender = current_gibber : @sender = current_user
  end
end
  # can user add photo to messages?

