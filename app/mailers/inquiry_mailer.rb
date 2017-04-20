class InquiryMailer < ApplicationMailer
  def creation_confirmation(inquiry)
    @inquiry = inquiry

    mail(
      to:       @inquiry.user.email,
      subject:  "You made an inquiry!"
    )
  end
end
