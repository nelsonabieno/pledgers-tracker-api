class AddKingdomBuilderToPayments < ActiveRecord::Migration[5.2]
  def change
    add_reference :kingdom_builders_payments, :kingdom_builder, foreign_key: true, index: true
  end
end
