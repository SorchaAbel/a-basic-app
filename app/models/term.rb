class Term < ActiveRecord::Base
  belongs_to :student

  scope :allterms, order: 'year_term DESC'
end
