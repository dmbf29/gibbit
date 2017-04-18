class Message < ApplicationRecord
  belongs_to :inquiry
  belongs_to :sender, polymorphic: true
end
