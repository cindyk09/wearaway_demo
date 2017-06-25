require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validates if attributes are empty' do
    let(:user) { User.new(username: nil, email: nil, password: nil, password_confirmation: nil) }

    it "is not valid without a username" do
      expect(user).to_not be_valid
    end

    it "is not valid without a email" do
      expect(user).to_not be_valid
    end
    it "is not valid without a password" do
      expect(user).to_not be_valid
    end

    it "is not valid without a password_confirmation" do
      expect(user).to_not be_valid
    end
  end

  describe 'validates if username' do
    let(:user) { User.new(username: "12", email: "123gmail.com", password: "qwerty", password_confirmation: "qwerty") }

    it "is less than 5 characters" do
      expect(user).to_not be_valid
    end

    it "email not in email format" do
      expect(user).to_not be_valid
    end
  end

  describe "when creating user and username already exists" do
    let(:user) { User.create(username: "cindy123", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty") }

    before do
      User.create(username: "cindy123", email: "cindy12@gmail.com", password: "qwerty", password_confirmation: "qwerty")
    end

    it "raises unique validation error" do
      expect(user).not_to be_valid
    end
  end

  describe "when creating user and email already exists" do
    let(:user) { User.create(username: "cindy12", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty") }

    before do
      User.create(username: "cindy123", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty")
    end

    it "raises unique validation error" do
      expect(user).not_to be_valid
    end
  end

  describe "when creating user and passwords don't match" do
    let(:user) { User.new(username: "cindy123", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwery") }

    it "raises password do not match validation error" do
      expect(user).not_to be_valid
    end
  end

end
