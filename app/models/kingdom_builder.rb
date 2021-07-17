class KingdomBuilder < ActiveRecord::Base
  belongs_to :parish, :foreign_key => :parishes_id
  belongs_to :area,  :foreign_key => :areas_id
  belongs_to :zone,  :foreign_key => :zone_id
  has_many :kingdom_builders_payments

  validates :email, presence: true, uniqueness: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "email address not valid" }
end