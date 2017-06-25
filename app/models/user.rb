class User < ApplicationRecord
  has_secure_token
  has_secure_password

  validates :username, :email, :password, presence: true
  # validates the below only if present. allow_blank: true
  validates :username, length: { minimum: 5 }, allow_blank: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, allow_blank: true
  validates :email, :username, uniqueness: true, on: :create
  # # The below checks for you for free if password == password_confirmation
  validates_presence_of :password_confirmation

end
