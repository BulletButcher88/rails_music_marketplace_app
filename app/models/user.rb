class User < ApplicationRecord
  #user creates item for sale
  has_many :items
  #user creates item review
  has_many :items_reviewed, :class_name => "ItemReview", :foreign_key => :item_review 
  #user creates buyer/seller review
  has_many :review_buyer, :class_name => "BuyerReview", :foreign_key => :seller_id
  has_many :review_seller, :class_name => "SellerReview", :foreign_key => :buyer_id
  #buyer/seller review of user
  has_many :purchase_reviews, :class_name => "BuyerReview", :foreign_key => :buyer_id
  has_many :sale_reviews, :class_name => "SellerReview", :foreign_key => :seller_id 
  #users item is purchased
  has_many :sales, :class_name => "Transaction", :foreign_key => :seller_id
  #users purchases an item
  has_many :purchases, :class_name => "Transaction", :foreign_key => :buyer_id

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reviews

  attr_writer :login

  def login
    @login || self.username || self.email
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:login]

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:username].nil?
        where(conditions).first
      else
      where(username: conditions[:username]).first
      end
    end
  end

  def average_seller_rating
    unless sale_reviews.empty?
      sum = 0
      sale_reviews.each do |review|
        sum += review.rate_seller
      end
      sum / sale_reviews.count
    end
  end

  def average_buyer_rating
    unless buyer_reviews.empty?
      sum = 0
      buyer_reviews.each do |review|
        sum += review.rate_item
      end
      sum / buyer_reviews.count
    end
  end

  def pick_up_address
   [user_postal_address_street, user_postal_address_suburb, user_postal_address_state, user_postal_address_postcode, user_postal_address_country].join(', ')
  end

  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  
  # after_commit :assign_stripe_id, on: :create
# private

#   def assign_stripe_id
#     customer = Stripe::Customer.create
#     self.stripe_id = customer.id
#   end
end
