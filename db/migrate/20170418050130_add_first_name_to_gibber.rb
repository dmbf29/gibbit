class AddFirstNameToGibber < ActiveRecord::Migration[5.0]
  def change
    add_column :gibbers, :first_name, :string
  end
end
