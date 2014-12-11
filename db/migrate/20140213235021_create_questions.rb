class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string "name"
      t.string "email"
      t.date "dob"
      t.string "location"
      t.string "comment", :limit => 100
      t.timestamps
    end
  end
end
