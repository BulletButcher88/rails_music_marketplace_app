class Transaction < ApplicationRecord
  belongs_to :item
  validates :total, presence: true, numericality: { greater_than: 0 }
  validates_numericality_of :total_in_cents, greater_than: 49, message: "must be at least 50 cents"
  
  belongs_to :buyer, :class_name => "User"
  belongs_to :seller, :class_name => "User"

  def convert_to_cents
    (total * 100).to_i
  end

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
