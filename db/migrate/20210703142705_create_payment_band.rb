class CreatePaymentBand < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_bands do |t|
      t.string :name
      t.integer :conservative_value
      t.integer :optimistic_value
      t.timestamps
    end
  end
end
