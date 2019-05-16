class CreateItems2 < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :brand
      t.string :model
      t.string :version
      t.string :release_year
      t.string :name
      t.string :description
      t.float :price
      t.string :condition
      t.integer :number_in_stock
      t.boolean :in_stock
      t.string :serial_number
      t.string :item_location
      t.boolean :pick_up
      t.boolean :delivery
      t.references :item_categories, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
