class Message < ApplicationRecord
  belongs_to :inquiry
  belongs_to :sender, polymorphic: true

  after_create :send_message_received_email

  def send_message_received_email
    UserMailer.message_received(self).deliver_now
  end
end
