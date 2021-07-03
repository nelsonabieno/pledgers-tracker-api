class CreateKingdomBuildersPayments < ActiveRecord::Migration[5.2]
  def change
    create_table :kingdom_builders_payments do |t|
      t.string :email
      t.integer :amount_paid
      t.string :entered_by
      t.timestamps
    end
  end
end
