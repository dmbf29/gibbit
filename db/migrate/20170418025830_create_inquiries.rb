class CreateInquiries < ActiveRecord::Migration[5.0]
  def change
    create_table :inquiries do |t|
      t.string :status
      t.text :description
      t.string :photo
      t.boolean :live
      t.integer :credits
      t.references :user, foreign_key: true
      t.references :gibber, foreign_key: true

      t.timestamps
    end
  end
end
