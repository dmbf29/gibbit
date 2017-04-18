class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :inquiry, foreign_key: true
      t.references :sender, polymorphic: true, index: true

      t.timestamps
    end
  end
end
