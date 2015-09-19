class DropListItemsTable < ActiveRecord::Migration
   def up
    drop_table :list_items
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
