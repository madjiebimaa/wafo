class AddLatLongToMerchants < ActiveRecord::Migration[7.0]
  def change
    add_column :merchants, :lat, :decimal, :precision => 15, :scale => 10
    add_column :merchants, :long, :decimal, :precision => 15, :scale => 10
    add_index :merchants, :lat
    add_index :merchants, :long
  end
end
