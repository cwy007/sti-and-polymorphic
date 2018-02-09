class User < ApplicationRecord
  has_many :tasks, dependent: :destroy
  
  validates_presence_of :username, :email
  validates_uniqueness_of :username

  has_secure_password
end
