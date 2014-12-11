class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string "name"
      t.date "dob"
      t.string "addr1", :limit => 25
      t.string "addr2", :limit => 25
      t.string "postcode", :limit => 10
      t.string "email", :limit => 25
      t.timestamps
    end
  end
end
