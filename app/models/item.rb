class Item < ApplicationRecord
  validates :name,  presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }

  belongs_to :category
  belongs_to :user
  has_many :item_reviews, dependent: :destroy
  has_many :transactions
  
  has_one_attached :picture

  def self.get_url_string(picture)
    return 
  end 

  def average_item_rating
    unless item_reviews.empty?
      sum = 0
      item_reviews.each do |review|
        sum += review.rate_item
      end
      sum / item_reviews.count
    end
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
