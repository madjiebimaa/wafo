class AddIndexToItems < ActiveRecord::Migration[7.0]
  def change
    add_index :items, :name
    add_index :items, :price
    add_index :items, :stock
  end
end
