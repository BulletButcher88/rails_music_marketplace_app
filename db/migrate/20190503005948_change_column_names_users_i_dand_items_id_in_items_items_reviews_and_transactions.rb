class ChangeColumnNamesUsersIDandItemsIdInItemsItemsReviewsAndTransactions < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :users_id, :user_id
    rename_column :item_reviews, :users_id, :user_id
    rename_column :item_reviews, :items_id, :item_id
    rename_column :transactions, :users_id, :user_id
    rename_column :transactions, :items_id, :item_id
  end
end
