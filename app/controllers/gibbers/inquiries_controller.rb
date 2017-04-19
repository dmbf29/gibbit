class Gibbers::InquiriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_gibber!

  def index
    @inquiries = Inquiry.all
    @empties = Inquiry.where(gibber_id: nil)
    @pendings = Inquiry.where(status: "pending")
    #pendings also needs where gibber_id is not nil
    @proposals = Inquiry.where(status: "proposed")
    @acceptions = Inquiry.where(status: "accepted")
    @rejections = Inquiry.where(status: "rejected")
    @completions = Inquiry.where(status: "completed")
  end

end
