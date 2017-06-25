module Api
  module V1
    class UsersController < ApplicationController
      before_action :set_user, only:[:show, :update, :destroy]

      def index
        users = User.all
        render json: users, status: 200
      end

      def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: {:status => 422, :errors => user.errors}, status: :unprocessable_entity
        end
      end

      def show
        render json: @user
      end

      def update
        if @user.update_attributes(user_params)
          render json: @user
        else
          render json: {:status => 422, :errors => @user.errors}, status: :unprocessable_entity
        end
      end

      def destroy
        @user.destroy
      end

      private
      def set_user
        @user = User.find params[:id]
      end

      def user_params
        params.permit(:username, :email, :password, :password_confirmation)
      end

    end
  end
end
