class SellerReview < ApplicationRecord
  belongs_to :reviewer, :class_name => "User", :foreign_key => :buyer_id
  belongs_to :seller, :class_name => "User"

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
