class UsersController < ApplicationController
  before_action :set_user, only:[:show, :update, :destroy]

  def index
    users = User.all
    render json: users
  end

  def new
    @user = User.new
  end

  def create!
    user = User.new(user_params)
    passwords_match
    # need to figure out how to throw error when they don't match.
    if user.save
      render json: user, status: :created
    else
      render_error(user, :unprocessable_entity)
    end
  end

  def show
    render json: @user
  end

  def update
    if @user.update_attributes(user_params)
      render json: @user, status: :ok
    else
      render_error(@user, :unprocessable_entity)
    end
  end

  def destroy
    @user.destroy
    head 204
  end


  private
  def passwords_match
    if @user.password == @user.password_confirmation
    else
      :alert => "You're passwords don't match."
    end
  end

  def set_user
    @user = User.find params[:id]
  end

  def user_params
    ActiveModelSerializers::Deserialization.jsonapi_parse(params)
  end

end
