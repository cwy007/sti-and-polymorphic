class User < ApplicationRecord
  validates_presence_of :username, :email
  validates_uniqueness_of :username
  
  has_secure_password
end
