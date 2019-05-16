class BuyerReview < ApplicationRecord
  belongs_to :buyer, :class_name => "User"
  belongs_to :reviewer, :class_name => "User", :foreign_key => :seller_id

  def average_seller_rating
    unless seller_reviews.empty?
      sum = 0
      seller_reviews.each do |review|
        sum += review.rate_seller
      end
      sum / seller_reviews.count
    end
  end
end
