class Student < ActiveRecord::Base
  has_many :terms
  has_many :results

  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, on: :create }
  validates :name, presence: true, length: { maximum: 30 }
  validates :addr1, presence: true

  scope :allstudents, order: 'name DESC'
end
