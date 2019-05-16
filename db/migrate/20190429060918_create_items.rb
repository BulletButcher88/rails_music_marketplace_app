class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :category
      t.integer :seller_id
      t.string :name
      t.string :description
      t.float :price
      t.integer :number_of_items
      t.string :address
      t.boolean :used_item

      t.timestamps
    end
  end
end
