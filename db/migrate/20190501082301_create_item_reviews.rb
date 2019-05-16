# frozen_string_literal: true

class CreateItemReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :item_reviews do |t|
      t.string :item_review_content
      t.float :rate_item
      t.references :users, foreign_key: true
      t.references :items, foreign_key: true

      t.timestamps
    end
  end
end
