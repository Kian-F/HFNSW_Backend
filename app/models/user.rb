class User < ApplicationRecord
  has_secure_password

  validates_presence_of :email
  validates_uniqueness_of :email
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, format: {with: VALID_EMAIL_REGEX}, uniqueness: true
end
