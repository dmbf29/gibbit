class AddRatingToInquiries < ActiveRecord::Migration[5.0]
  def change
    add_column :inquiries, :rating, :integer, default: 0, null: false
    add_column :inquiries, :review, :text
  end
end
