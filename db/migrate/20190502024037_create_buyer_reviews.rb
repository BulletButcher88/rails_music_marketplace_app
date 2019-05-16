# frozen_string_literal: true

class CreateBuyerReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :buyer_reviews do |t|
      t.string :buyer_review_content
      t.integer :rate_buyer
      t.references :transaction, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
