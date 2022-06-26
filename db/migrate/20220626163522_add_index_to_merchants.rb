class AddIndexToMerchants < ActiveRecord::Migration[7.0]
  def change
    add_index :merchants, :name
  end
end
