class AddNewColumn < ActiveRecord::Migration
  def change
    add_column("Administrators", "username", :string, :limit => 25)
    add_index("Administrators", "username")
  end
end
