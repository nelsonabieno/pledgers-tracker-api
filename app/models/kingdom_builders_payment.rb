class KingdomBuildersPayment < ActiveRecord::Base
  belongs_to :kingdom_builder

  def self.sum_user_payments(email)
    where(email: email).sum(:amount_paid)
  end
end