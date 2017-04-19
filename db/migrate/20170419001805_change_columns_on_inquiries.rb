class ChangeColumnsOnInquiries < ActiveRecord::Migration[5.0]
  def change
    change_column :inquiries, :live, :boolean, default: false
    change_column :inquiries, :status, :string, default: "pending"
  end
end
