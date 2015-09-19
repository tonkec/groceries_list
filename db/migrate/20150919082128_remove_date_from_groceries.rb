class RemoveDateFromGroceries < ActiveRecord::Migration
  def change
    remove_column :groceries, :date, :datetime
  end
end
