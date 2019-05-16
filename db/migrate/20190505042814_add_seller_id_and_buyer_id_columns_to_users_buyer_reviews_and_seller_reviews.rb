class AddSellerIdAndBuyerIdColumnsToUsersBuyerReviewsAndSellerReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :buyer_id, :bigint
    add_column :users, :seller_id, :bigint
    add_column :buyer_reviews, :seller_id, :bigint
    add_column :buyer_reviews, :buyer_id, :bigint
    add_column :seller_reviews, :seller_id, :bigint
    add_column :seller_reviews, :buyer_id, :bigint  
  end
end
