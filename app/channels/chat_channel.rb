class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from specific_channel
  end

  def receive(data)
    # binding.pry

    ActionCable.server.broadcast \
      specific_channel, format_response(data)
  end

  private
  def specific_channel
    "chat_#{params[:room]}"
  end

  # Limit text to 140 characters
  def filter(msg)
    msg.to_s[0...140]
  end

  def format_response(data)
    {
      content: filter( data["content"] )
    }
  end
end
