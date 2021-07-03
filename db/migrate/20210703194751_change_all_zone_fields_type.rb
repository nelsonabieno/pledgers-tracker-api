class ChangeAllZoneFieldsType < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :zone
    add_column :areas, :zone, :string
    remove_column :kingdom_builders, :zone
    add_column :kingdom_builders, :zone, :string
  end
end
