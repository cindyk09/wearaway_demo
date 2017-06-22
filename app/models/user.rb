class User < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :username, :email, :password, :password_confirmation, presence: true
  validates :username, length: { minimum: 5 }
  validates :email, :username, uniqueness: true

end
