# frozen_string_literal: true

class CreateItemCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :item_categories do |t|
      t.string :item_category

      t.timestamps
    end
  end
end
