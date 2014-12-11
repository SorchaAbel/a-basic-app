class AmendCommentColumn < ActiveRecord::Migration
  def self.up
    change_column("questions","comment", :string, :limit => 500)
  end
  
  def self.down
    change_column("questions","comment", :string, :limit => 100)
  end
end
