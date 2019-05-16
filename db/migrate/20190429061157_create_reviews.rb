class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :transaction_id
      t.string :item_review_content
      t.string :user_review_content
      t.integer :user_rating

      t.timestamps
    end
  end
end
