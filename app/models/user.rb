class User < ActiveRecord::Base
  has_secure_password

  validates :first_name, presence: true, length:{ minimum: 3 }
  validates :last_name, presence: true, length:{ minimum: 3 }
  validates :password, presence: true, length:{ minimum: 5 }
  validates :password_confirmation, confirmation: { case_sensitive: true }
  validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
end