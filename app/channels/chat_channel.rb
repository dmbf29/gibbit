class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from specific_channel
  end

  def receive(data)
    # binding.pry
    @inquiry = Inquiry.find(data["inquiry_id"])
    @message = Message.new(content: data["content"])
    @message.inquiry = @inquiry

    set_sender(data)

    @message.sender = @sender
    @message.save

    data["sender_first_name"] = @sender.first_name

    # if @message.save
    #   redirect_to inquiry_path(@inquiry)
    # else
    #   render 'inquiries/show'
    #   # need to check
    # end
    ActionCable.server.broadcast \
      specific_channel, data
  end

  private
  def specific_channel
    "chat_#{params[:room]}"
  end

  def set_sender(data)
    @sender =  data["sender_type"] == "gibber" ? Gibber.find(data["sender_id"]) : User.find(data["sender_id"])
  end
end
