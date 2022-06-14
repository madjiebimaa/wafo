class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.belongs_to :merchant, index: true, foreign_key: true
      t.string :name, null: false
      t.text :description
      t.integer :price, null: false
      t.integer :stock, null: false
      t.text :image_url
      t.datetime :served_at, null: false
      t.datetime :expired_at, null: false

      t.timestamps
    end
  end
end
