class ChangeColumnOnInquiries < ActiveRecord::Migration[5.0]
  def change
    change_column :inquiries, :credits, :integer, default: 0
  end
end
