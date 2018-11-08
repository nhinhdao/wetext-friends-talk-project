class CreateConnections < ActiveRecord::Migration[5.2]
  def change
    create_table :connections do |t|
      t.integer :user_id
      t.integer :friend_id

      t.timestamps
    end
    add_index :connections, [:user_id, :friend_id], unique: true, name: 'uid_fid'
    add_index :connections, [:friend_id, :user_id], unique: true, name: 'fid_uid'
  end
end
