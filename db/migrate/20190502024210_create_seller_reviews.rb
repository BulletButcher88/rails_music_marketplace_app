# frozen_string_literal: true

class CreateSellerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_reviews do |t|
      t.string :seller_review_content
      t.integer :rate_seller
      t.references :transaction, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
