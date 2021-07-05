require 'jwt'
class JsonWebToken
  ALGORITHM = 'HS256'

  class << self
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, auth_secret, ALGORITHM)
    end

    def decode(token)
      puts "token &&&& #{token}"
      puts "auth_secret &&&& #{auth_secret}"
      puts "ENV['AUTH_SECRET'] &&&& #{ENV['AUTH_SECRET']}"
      puts " Rails.application.secrets.secret_key_base &&&& #{ Rails.application.secrets.secret_key_base}" #No result!
      res= JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM }).first
      # res = JWT.decode(token, auth_secret)[0]
      # res= JWT.decode(token, auth_secret, true, { algorithm: ALGORITHM }).first
      puts "res @@@@ #{res}"
      # res
      # puts "body &&&& #{body}"
      HashWithIndifferentAccess.new res
      # puts " HashWithIndifferentAccess.new body &&&& #{ HashWithIndifferentAccess.new body}"
    # rescue
    #   nil
    end

    def auth_secret
      ENV['AUTH_SECRET']
    end
  end
end