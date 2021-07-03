class KingdomBuilder < ActiveRecord::Base
  belongs_to :parish
  belongs_to :area
  has_many :kingdom_builders_payments

  validates :email, presence: true, uniqueness: true
end