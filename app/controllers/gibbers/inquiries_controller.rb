class Gibbers::InquiriesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :authenticate_gibber!

  def index
    @inquiries = Inquiry.all
  end

end
