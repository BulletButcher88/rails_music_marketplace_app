class CreateTransactions < ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.integer :item_id
      t.integer :buyer_id
      t.integer :seller_id

      t.timestamps
    end
  end
end
