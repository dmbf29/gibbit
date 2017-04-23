class Notice < ApplicationRecord
  belongs_to :user
  belongs_to :gibber
  belongs_to :notifiable, polymorphic: true

  scope :unread, -> { where(read_at: nil) }
end

