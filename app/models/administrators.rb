require 'digest/sha1'

# TODO Model Name should always be singular
class Administrators < ActiveRecord::Base
  # attr_protected :hashed_password, :salt
  attr_accessor :password # added a non database attribute

  before_save :create_hashed_password
  after_save :clear_password

  def self.make_salt(username="")
    Digest::SHA1.hexdigest("Use #{username} with #{Time.now} to make salt")
  end

  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("put #{salt} on the #{password}")
  end

  def self.authenticate(username="",password="")
      user = Administrators.find_by_username(username)
      if user
        if user.hashed_password == Administrators.hash_with_salt(password,user.salt)
          return user
        end
      else
        return false
      end
  end

  def match(password="")
       hashed_password == Administrators.hash_with_salt(password,salt)
   end

  private

  def create_hashed_password
    unless password.blank?
      self.salt = Administrators.make_salt(username) if salt.blank?
      self.hashed_password = Administrators.hash_with_salt(password,salt)
    end
  end

  def clear_password
    self.password = nil
  end


end
