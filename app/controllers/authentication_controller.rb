class AuthenticationController < ApplicationController
  skip_before_action :authenticate_request

  def authenticate
    command = AuthenticateUser.call(params[:email], params[:password])

    if command.success?
      User.find_by_email(params[:email]).update_attribute(:token, command.result)

      render json: { auth_token: command.result }, status: :ok
    else
      render json: { error: command.errors }, status: :unauthorized
    end
  end

  def destroy
    if fetch_user
      @current_user = nil
      render json: { message: 'Thanks for using our app, good bye!' }, status: :ok
    else
      render json: { message: 'You have to be logged in' }, status: :unauthorized
    end
  end

  private

  def fetch_user
    @current_user = AuthorizeApiRequest.call(request.headers).result
  end
end