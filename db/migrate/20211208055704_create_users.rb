class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email , null: false
      t.string :firstname
      t.string :lastname
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.integer :is_admin, limit: 1

      t.timestamps null: false
    end
    add_index :users, :email, unique: true
  end
end
