class User < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :username, :email, :password, presence: true
  validates :username, length: { minimum: 5 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :email, :username, uniqueness: true, on: :create
  # # The below checks for you for free if password == password_confirmation
  validates_presence_of :password_confirmation

end
