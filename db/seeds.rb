# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'destroying seed data'
User.destroy_all
Category.destroy_all
Item.destroy_all
Transaction.destroy_all
BuyerReview.destroy_all
SellerReview.destroy_all
ItemReview.destroy_all
puts 'starting seed'

# seeding users
puts 'seeding users'
user1 = User.new({ :email => "markjamesbutcher@gmail.com", :admin => 'true', :first_name => 'Mark', :last_name => 'Butcher', :username => 'asdfbullet', :user_billing_address_street => '278 BunnyHop Road', :user_billing_address_suburb => 'Bunnyville', :user_billing_address_state => 'same', :user_billing_address_postcode => '3000', :user_billing_address_country => 'Field of Dreams', :user_postal_address_street => 'same', :user_postal_address_suburb => 'same', :user_postal_address_state => 'same', :user_postal_address_postcode => 'same', :user_postal_address_country => 'same', :user_contact_tel_number => '0449147381', :password => 'password321', :password_confirmation => 'password321' })
user1.save
user2 = User.new({ :email => "wsmartin23@gmail.com", :admin => 'true', :first_name => 'Wade', :last_name => 'Martin', :username => 'wsmartin', :user_billing_address_street => '1 BunnyHop Road', :user_billing_address_suburb => 'Bunnyville', :user_billing_address_state => 'Vic', :user_billing_address_postcode => '3000', :user_billing_address_country => 'Australia', :user_postal_address_street => 'same', :user_postal_address_suburb => 'same', :user_postal_address_state => 'same', :user_postal_address_postcode => 'same', :user_postal_address_country => 'same', :user_contact_tel_number => '0499049936', :password => 'passcode123', :password_confirmation => 'passcode123' })
user2.save
puts 'users successfully seeded'

  # seeding categories
if Category.first == nil
  puts 'seeding categories'
  categories = ['Guitars and Amps', 'Percussion and Drums', 'Keyboard and Pianos', 'Woodwind and Brass', 'DJ Gear', 'Accessories', 'Other Instruments']
  categories.each do |category|
    new_category = Category.new
    new_category.item_category = category
    new_category.save
  end 
  puts 'categories successfully seeded'
end 

# seeding items
puts "seeding items"
guitar = Item.new({ :brand => 'Fender', :model => 'Axe', :version => 'classic', :release_year => '2010', :name => 'Fender Classic', :description => 'really nice sound', :price => '800.00', :condition => 'used', :number_in_stock => '1', :in_stock => 'true', :serial_number => '200100300123', :item_location => 'Melbourne, Victoria, Australia', :pick_up => 'true', :delivery => 'false', :category_id => '1', :user_id => '1'})
guitar.save
piano = Item.new({ :brand => 'Yamaha', :model => 'Grand Piano', :version => 'classic', :release_year => '1978', :name => 'Classic piano', :description => 'beautiful', :price => '100000.00', :condition => 'used', :number_in_stock => '1', :in_stock => 'true', :serial_number => '200100356474', :item_location => 'Sydney, New South Wales, Australia', :pick_up => 'true', :delivery => 'false', :category_id => '3', :user_id => '2'})
piano.save
korg = Item.new({ :brand => 'Korg', :model => 'XP-HELLRAISER', :version => 'NEW', :release_year => '1998', :name => 'Hi_tech', :description => 'Super sonic cool sounds', :price => '10000', :condition => 'new', :number_in_stock => '4', :in_stock => 'true', :serial_number => '200100456474', :item_location => 'Sydney, New South Wales, Australia', :pick_up => 'true', :delivery => 'false', :category_id => '3', :user_id => '2'})
korg.save
trumpt = Item.new({ :brand => 'Brass Man', :model => 'JAZZMASTER', :version => 'NEW', :release_year => '1998', :name => 'old', :description => 'Pure sounds', :price => '10000', :condition => 'new', :number_in_stock => '2', :in_stock => 'true', :serial_number => '200100456474', :item_location => 'Sydney, New South Wales, Australia', :pick_up => 'true', :delivery => 'false', :category_id => '4', :user_id => '1'})
trumpt.save
drum = Item.new({ :brand => 'Pearl Classic', :model => 'BamBamBoo', :version => 'limited model', :release_year => '1928', :name => 'old', :description => 'Pure sounds', :price => '100', :condition => 'new', :number_in_stock => '2', :in_stock => 'true', :serial_number => '200100456474', :item_location => 'Sydney, New South Wales, Australia', :pick_up => 'true', :delivery => 'false', :category_id => '2', :user_id => '1'})
drum.save


puts 'items successfully seeded'

# seeding transactions
puts "seeding transactions"
transaction1 = Transaction.new({ :total => '5.00', :payment_reference => 'pay ref', :pick_up => 'true', :delivery => 'true', :pick_up_address => 'pick_up_address', :delivery_address => 'delivery_string', :seller_id => '1',:buyer_id => '2', :user_id => '2', :item_id => '1'})
transaction1.save
payment2 = Transaction.new({ :total => '5.00', :payment_reference => 'pay ref', :pick_up => 'true', :delivery => 'true', :pick_up_address => 'pick_up_address', :delivery_address => 'delivery_string', :seller_id => '2',:buyer_id => '1', :user_id => '1', :item_id => '2'})
payment2.save
puts 'transactions successfully seeded'

# seeding seller reviews
puts "seeding seller reviews"
seller_review1 = SellerReview.new({ :seller_review_content => 'quick deviery, item as described', :rate_seller => '5', :seller_id => '1', :buyer_id => '2'})
seller_review1.save
seller_review2 = SellerReview.new({ :seller_review_content => 'quick deviery, item as described', :rate_seller => '5', :seller_id => '2', :buyer_id => '1'})
seller_review2.save
puts 'seller reviews successfully seeded'

# seeding buyer reviews
puts "seeding buyer reviews"
buyer_review1 = BuyerReview.new({ :buyer_review_content => 'quick payment, 5 stars', :rate_buyer => '5', :seller_id => '1', :buyer_id => '2'})
buyer_review1.save
buyer_review2 = BuyerReview.new({ :buyer_review_content => 'quick payment, 5 stars', :rate_buyer => '5', :seller_id => '2', :buyer_id => '1'})
buyer_review2.save
puts 'buyer reviews successfully seeded'

# seeding item reviews
puts "seeding item review"
review1 = ItemReview.new({ :item_review_content => 'good deal, happy as', :rate_item => '5.00', :user_id => '1', :item_id => '2'})
review1.save
review1 = ItemReview.new({ :item_review_content => 'good deal, happy as', :rate_item => '5.00', :user_id => '2', :item_id => '1'})
review1.save
puts 'item reviews successfully seeded'

puts "Seeding Over"