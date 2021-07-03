class RenameParishAreaFieldsAddPledgeTypeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :kingdom_builders, :pledge_type, :string
    remove_column :kingdom_builders, :parish
    remove_column :kingdom_builders, :area

  end
end
