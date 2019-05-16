# frozen_string_literal: true

class RemoveTablesCategoriesReviewsItemsTransactions < ActiveRecord::Migration[5.2]
  def change
    drop_table :categories
    drop_table :items
    drop_table :reviews
    drop_table :transactions
  end
end
