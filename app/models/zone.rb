class Zone < ActiveRecord::Base
  has_many :areas
  has_many :kingdom_builders
end