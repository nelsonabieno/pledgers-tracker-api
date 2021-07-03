class ChangeZoneFieldInUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :kingdom_builders, :zone
    add_column :kingdom_builders, :zone, :integer
  end
end
