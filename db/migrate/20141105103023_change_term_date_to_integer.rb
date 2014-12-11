class ChangeTermDateToInteger < ActiveRecord::Migration
  def up
  	change_column :terms, :year, :integer
  end

  def down
  change_column :terms, :year, :date
  end
end
