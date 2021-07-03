class RefactorZoneFieldsToForeignKeys < ActiveRecord::Migration[5.2]
  def change
    remove_column :areas, :zone
    remove_column :kingdom_builders, :zone
    add_reference :areas, :zone, foreign_key: true, index: true
    add_reference :kingdom_builders, :zone, foreign_key: true, index: true
  end
end
