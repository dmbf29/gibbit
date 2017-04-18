class AddEmailAndFirstNameToInquiries < ActiveRecord::Migration[5.0]
  def change
    add_column :inquiries, :email, :string
    add_column :inquiries, :first_name, :string
  end
end
