require 'jwt'
class ApplicationController < ActionController::API

  before_action :authenticate_request
  skip_before_action :authenticate_request, only: [:create]

  attr_reader :current_user

  private

  def authenticate_request
    # byebug
    # puts "======>>>> #{AuthorizeApiRequest.call(request.headers).result.inspect}"
    # puts "request.env['HTTP_AUTHORIZATION'] ======>>>> #{request.env['HTTP_AUTHORIZATION'].inspect}"
    # puts "request.env['HTTP_AUTHORIZATION'] class ======>>>> #{request.env['HTTP_AUTHORIZATION'].class}" #String

    # puts "request.headers ======>>>> #{request.headers.inspect}"
    # puts "request.headers class ======>>>> #{request.headers.class}" #ActionDispatch::Http::Headers

    # byebug
    request_header = request.env['HTTP_AUTHORIZATION'] || request.headers
    # puts "request_header  ======>>>> #{request_header}"
    @current_user = AuthorizeApiRequest.call(request_header).result
    puts "@current_user #{@current_user.inspect}"
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
