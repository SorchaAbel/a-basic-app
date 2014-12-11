class AddPictureToQuestions < ActiveRecord::Migration
  def self.up
    add_column("questions", "picture", :string)
  end
  
  def self.down
     remove_column("questions", "picture") 
  end
end


