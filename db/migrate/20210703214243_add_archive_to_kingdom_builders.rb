class AddArchiveToKingdomBuilders < ActiveRecord::Migration[5.2]
  def change
    add_column :kingdom_builders, :archive, :boolean, default: false
  end
end
