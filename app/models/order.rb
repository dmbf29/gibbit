class Order < ApplicationRecord
  belongs_to :inquiry

  monetize :amount_cents
end
