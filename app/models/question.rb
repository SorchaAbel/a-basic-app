require 'valid_email'
class Question < ActiveRecord::Base
  validates :email, :presence => true, :email => true
  mount_uploader :picture, PictureUploader

  scope :allquestions, order: 'location DESC'

end
