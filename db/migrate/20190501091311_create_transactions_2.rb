class CreateTransactions2< ActiveRecord::Migration[5.2]
  def change
    create_table :transactions do |t|
      t.float :total
      t.string :payment_reference
      t.boolean :pick_up
      t.boolean :delivery
      t.string :pick_up_address
      t.string :delivery_address
      t.bigint :seller_id
      t.bigint :buyer_id
      t.references :items, foreign_key: true
      t.references :users, foreign_key: true

      t.timestamps
    end
  end
end
