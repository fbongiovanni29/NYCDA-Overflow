class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :encrypted_password
      t.string :salt
      t.timestamps null: false
    end
  end
end