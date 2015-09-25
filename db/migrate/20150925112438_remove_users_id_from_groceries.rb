class RemoveUsersIdFromGroceries < ActiveRecord::Migration
  def change
    remove_column :groceries, :users_id, :integer
  end
end
