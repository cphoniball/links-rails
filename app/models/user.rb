class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true
  validates :password, confirmation: true, length: { minimum: 8 }
end
