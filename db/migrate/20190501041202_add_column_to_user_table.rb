# frozen_string_literal: true

class AddColumnToUserTable < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :user_billing_address_street, :string
    add_column :users, :user_billing_address_suburb, :string
    add_column :users, :user_billing_address_state, :string
    add_column :users, :user_billing_address_postcode, :string
    add_column :users, :user_billing_address_country, :string
    add_column :users, :user_postal_address_street, :string
    add_column :users, :user_postal_address_suburb, :string
    add_column :users, :user_postal_address_state, :string
    add_column :users, :user_postal_address_postcode, :string
    add_column :users, :user_postal_address_country, :string
    add_column :users, :user_contact_tel_number, :string
  end
end
