class AddPasswordDigestToAdminUsers < ActiveRecord::Migration[5.1]
  def up
  	  	add_column("admin_users", "password_digest", :string)
  	  	remove_column("admin_users", "hashed_password")
  end
  def down
  	  	add_column("admin_users", "hashed_password",:string, :limit => 40)
  	  	remove_column("admin_users", "password_digest")
  end
end
