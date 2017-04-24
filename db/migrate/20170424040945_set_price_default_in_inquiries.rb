class SetPriceDefaultInInquiries < ActiveRecord::Migration[5.0]
  def change
    change_column :inquiries, :price_cents, :integer, default: 400
  end
end
