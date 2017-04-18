class Inquiry < ApplicationRecord
  belongs_to :user
  belongs_to :gibber
  has_many :messages

  validates :descriptions, presence: true
end
