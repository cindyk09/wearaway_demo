require 'rails_helper'


# type controller - call out to know where it goes. precautionary meassure
RSpec.describe Api::V1::UsersController, type: :controller do

  describe "GET #index" do

    it "returns 200 status on sucess when it returns all users" do
      process :index, method: :get
      # test for the 200 status-code
      expect(response.status).to eq(200)
    end

  end

  describe "POST #create" do
    context "succes cases" do

      # before each it block create this user with these attirbutes
      before(:each) do
        process :create, method: :post, params: {username: "cindy123", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty"}
      end

      it "returns 201 status on sucess when it creates new user" do
        expect(response.status).to eq(201)
      end

      it "returns user with the correct attributes after being created created" do
        expect(json["username"]).to eq ("cindy123")
        expect(json["email"]).to eq ("cindy123@gmail.com")
      end
    end

    context "error cases" do
      context "when user doesn't provide username" do

        before(:each) do
          process :create, method: :post, params: {username: nil, email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty"}
        end

        it "returns 422 status" do
          expect(response.status).to eq(422)
        end

        it "returns an error message" do
          expect(json["errors"].values.flatten).to eq (["can't be blank"])
        end
      end

      context "when user provides username with less than 5 characters" do
        before(:each) do
          process :create, method: :post, params: {username: "Cind", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty"}
        end
        it "returns 422 status" do
          expect(response.status).to eq(422)
        end

        it "returns an error message" do
          expect(json["errors"].values.flatten).to eq (["is too short (minimum is 5 characters)"])
        end
      end

      context "when user provides username already exists" do

        before(:each) do
          User.create(username: "cindy123", email: "cindy12@gmail.com", password: "qwerty", password_confirmation: "qwerty")
          process :create, method: :post, params: {username: "cindy123", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty"}
        end
        it "returns 422 status" do
          expect(response.status).to eq(422)
        end

        it "returns an error message" do
          expect(json["errors"].values.flatten).to eq (["has already been taken"])
        end
      end

      context "when user provides email already exists" do

        before(:each) do
          User.create(username: "cindy12", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty")
          process :create, method: :post, params: {username: "cindy123", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwerty"}
        end
        it "returns 422 status" do
          expect(response.status).to eq(422)
        end

        it "returns an error message" do
          expect(json["errors"].values.flatten).to eq (["has already been taken"])
        end
      end

      context "when user doesn't provide an email" do
        before(:each) do
          process :create, method: :post, params: {username: "cindy123", email: nil, password: "qwerty", password_confirmation: "qwerty"}
        end
        it "returns 422 status" do
          expect(response.status).to eq(422)
        end

        it "returns an error message" do
          expect(json["errors"].values.flatten).to eq (["can't be blank"])
        end
      end

      context "when user doesn't provide a proper email" do
        before(:each) do
          process :create, method: :post, params: {username: "cindy123", email: "cindy123gmail.com", password: "qwerty", password_confirmation: "qwerty"}
        end
        it "returns 422 status" do
          expect(response.status).to eq(422)
        end

        it "returns an error message" do
          expect(json["errors"].values.flatten).to eq (["is invalid"])
        end
      end

      context "when user passwords don't match" do
        before(:each) do
          process :create, method: :post, params: {username: "cindy123", email: "cindy123@gmail.com", password: "qwerty", password_confirmation: "qwey"}
        end
        it "returns 422 status" do
          expect(response.status).to eq(422)
        end

        it "returns an error message" do
          expect(json["errors"].values.flatten).to eq (["doesn't match Password"])
        end
      end
    end

  end

end
