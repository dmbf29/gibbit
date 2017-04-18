class Gibber < ApplicationRecord
  has_many :messages, :as => :sender
  has_many :inquiries
end
