class AddStatusToGibber < ActiveRecord::Migration[5.0]
  def change
    add_column :gibbers, :status, :string
  end
end
