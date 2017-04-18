class CreateGibbers < ActiveRecord::Migration[5.0]
  def change
    create_table :gibbers do |t|
      t.string :email
      t.string :name
      t.string :status

      t.timestamps
    end
  end
end
