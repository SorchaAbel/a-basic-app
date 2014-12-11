class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer "student_id"
      t.integer "term_id"
      t.float "grade"
      t.timestamps
    end
    
    add_index("results", ["student_id","term_id"])
    
  end
end
