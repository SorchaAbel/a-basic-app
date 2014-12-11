class Result < ActiveRecord::Base
  belongs_to :student
  scope :all_results, order: 'grade DESC'

end
