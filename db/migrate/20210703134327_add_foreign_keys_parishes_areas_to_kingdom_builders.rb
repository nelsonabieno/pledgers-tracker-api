class AddForeignKeysParishesAreasToKingdomBuilders < ActiveRecord::Migration[5.2]
  def change
    add_reference :kingdom_builders, :parishes, foreign_key: true, index: true
    add_reference :kingdom_builders, :areas, foreign_key: true, index: true
  end
end
