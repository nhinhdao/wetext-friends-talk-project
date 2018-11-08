class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :mcontent
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
  end
end
