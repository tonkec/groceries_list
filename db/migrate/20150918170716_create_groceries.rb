class CreateGroceries < ActiveRecord::Migration
  def change
    create_table :groceries do |t|
      t.string :title
      t.datetime :date
      t.text :description

      t.timestamps null: false
    end
  end
end
