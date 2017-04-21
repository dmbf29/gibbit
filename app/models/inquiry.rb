class Inquiry < ApplicationRecord
  after_update :send_inquiry_email, if: :proposed?

  belongs_to :user, optional: true
  belongs_to :gibber, optional: true
  has_many :messages, :dependent => :destroy

  mount_uploader :photo, PhotoUploader

  validates :description, presence: true
  # validates :email, presence: true
  # validates :first_name, presence: true
  # validates :status, presence: true, inclusion: { in: %w(pending proposed accepted rejected completed) }

  def send_inquiry_email
    UserMailer.inquiry(self).deliver_now
  end

  def proposed?
    status == "proposed"
  end
end
