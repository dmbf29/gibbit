class Inquiry < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :gibber, optional: true
  has_many :messages

  mount_uploader :photo, PhotoUploader

  validates :description, presence: true
  # validates :email, presence: true
  # validates :first_name, presence: true
  # validates :status, presence: true, inclusion: { in: %w(pending proposed accepted rejected completed) }
end
