require 'jwt'
class AuthorizeApiRequest
  prepend SimpleCommand
  attr_reader :headers

  def initialize(headers = {})
    @headers = headers
    # puts "------%%%   #{@headers.inspect}"
  end

  def call
    user
  end

  private

  def user
    @user ||= User.find(decoded_auth_token[:user_id]) if decoded_auth_token
    @user || errors.add(:token, 'Invalid token') && nil
  end

  def decoded_auth_token
    # byebug
    # puts "http_auth_header #{http_auth_header.inspect}"
    puts "JsonWebToken.decode(http_auth_header).inspect} #{JsonWebToken.decode(http_auth_header).inspect}"
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    # byebug
    # puts "Authorization ******** #{headers['Authorization'].inspect}"
    # puts "HTTP_AUTHORIZATION******** #{request.env['HTTP_AUTHORIZATION'].inspect}"
    # puts "**#######   #{@headers.inspect}"
    if @headers.present?
      return @headers.to_s.split(' ').last
    else
      errors.add(:token, 'Missing token')
    end
    nil
  end

end