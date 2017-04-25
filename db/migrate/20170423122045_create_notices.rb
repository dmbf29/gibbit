class CreateNotices < ActiveRecord::Migration[5.0]
  def change
    create_table :notices do |t|
      t.references :user, foreign_key: true
      t.references :gibber, foreign_key: true
      t.datetime :read_at
      t.string :action
      t.string :notifiable_id
      t.string :integer
      t.string :notifiable_type

      t.timestamps
    end
  end
end
