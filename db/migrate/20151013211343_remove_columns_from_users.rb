class RemoveColumnsFromUsers < ActiveRecord::Migration
  def up
  	remove_column :users, :salt, :string
  	remove_column :users, :encrypted_password, :string
  	add_column :users, :password_digest, :string
  end

  def down
  	add_column :users, :salt, :string
  	add_column :users, :encrypted_password, :string
  	remove_column :users, :encrypted_password, :string
  end
end
