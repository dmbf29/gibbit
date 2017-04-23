class NoticesController < ApplicationController
  before_action :authenticate_user!

  def index
    @notices = Notice.where(user: current_user).unread
  end

  def mark_as_read
    @notices = Notice.where(user: current_user).unread
    @notices.update.all(read_at: Time.zone.now)
    render json: {success: true}
  end
end
