class CreateKingdomBuilders < ActiveRecord::Migration[5.2]
  def change
    create_table :kingdom_builders do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :parish
      t.string :area
      t.string :zone
      t.string :payment_mode
      t.integer :amount_pledge
      t.integer :total_amount_paid
      t.integer :payment_mode_based_amount
      t.string :status
      t.string :entered_by
      t.timestamps
    end
  end
end
