class UserController < ApplicationController
  before_action :find_user, only: [:show, :update, :destroy]

  def index
    render json: { users: User.all }, status: :ok
  end

  def create
    @user = User.new(user_params)

    if @user.save
      render json: { user: @user, message: 'user successfully created' }, status: :created
    else
      render json: { error: @user.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def show
  end

  def update
    @user = User.new(user_params)

    if @user.update
      render json: { user: @user, message: 'user record successfully updated' }, status: :ok
    else
      render json: { error: @user.errors.full_messages.to_sentence }, status: :unprocessable_entity
    end
  end

  def destroy
    if @user.destroy
      render json: { user: @user, message: 'user record successfully deleted' }, status: :ok
    else
      render json: { error: @user.errors.full_messages.to_sentence }, status: :internal_server_error
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:email, :password, :password_confirmation, :token, :expired_at, :first_name, :last_name)
  end
end