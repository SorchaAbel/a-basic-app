class ChangeTermColumn < ActiveRecord::Migration
  def self.up
    rename_column("terms","term", "year_term")
  end

  def self.down
    rename_column("terms","year_term", "term")
  end
end
