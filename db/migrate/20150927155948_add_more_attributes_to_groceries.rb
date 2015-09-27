class AddMoreAttributesToGroceries < ActiveRecord::Migration
  def change
    add_column :groceries, :price, :integer
    add_column :groceries, :amount, :integer
    add_column :groceries, :checked, :boolean
  end
end
