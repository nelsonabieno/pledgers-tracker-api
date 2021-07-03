class ChangeAreasZoneToInteger < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :zone
    add_column :areas, :zone, :integer
  end
end
