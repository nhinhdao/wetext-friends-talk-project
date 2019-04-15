class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email, default: 'https://i.imgur.com/kNsHwNn.jpg'
      t.string :image
      t.string :uid
      t.string :password_digest

      t.timestamps
    end
  end
end
