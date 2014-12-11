class CreateTerms < ActiveRecord::Migration
  def change
    create_table :terms do |t|
      t.integer "term"
      t.date "year"
      t.integer "student_id"
      t.float "amt_paid"
      t.string "location"
      t.timestamps
    end
    add_index("terms", "student_id")
  end
end
