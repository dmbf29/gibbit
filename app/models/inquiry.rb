class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :gibber
  has_many :messages

  validates :description, presence: true
end
