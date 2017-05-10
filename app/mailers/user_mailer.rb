class UserMailer < ApplicationMailer

  def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to Gibbit')
  end

  def received_proposal(inquiry)
     @user = inquiry.user

    mail(to: @user.email, subject: 'You have a proposal for your Gibbit request!')
  end

  def new_inquiry(inquiry)
    @user = inquiry.user

    mail(to: Gibber.second.email, subject: 'You have a new Gibbit request from #{@user.first_name}!')
  end
end
