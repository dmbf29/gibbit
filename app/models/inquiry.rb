class Inquiry < ApplicationRecord
  after_update :send_inquiry_email, if: :proposed?
  after_create :send_new_inquiry_email

  belongs_to :user, optional: true
  belongs_to :gibber, optional: true
  has_many :messages, :dependent => :destroy
  has_many :orders

  mount_uploader :photo, PhotoUploader

  monetize :price_cents

  validates :description, presence: true
  validates :rating, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
  # validates :email, presence: true
  # validates :first_name, presence: true
  # validates :status, presence: true, inclusion: { in: %w(pending proposed accepted rejected completed) }

  def send_inquiry_email
    UserMailer.received_proposal(self).deliver_now
  end

  def proposed?
    status == "proposed"
  end

  def send_new_inquiry_email
    UserMailer.new_proposal(self).deliver_now
  end
end
