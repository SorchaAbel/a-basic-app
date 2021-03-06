class CreateAdminUsers < ActiveRecord::Migration
  def self.up
    create_table :admin_users do |t|
       t.string "first_name"
        t.string "last_name"
        t.string "email", :default => "", :null => false
        t.string "salt"
        t.string "hashed_password"
        t.timestamps
    end
  end
  
  def self.down
      drop_table :admin_users
  end
end
