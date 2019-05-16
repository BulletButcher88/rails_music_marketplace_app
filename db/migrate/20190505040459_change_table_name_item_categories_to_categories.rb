class ChangeTableNameItemCategoriesToCategories < ActiveRecord::Migration[5.2]
  def change
    rename_table :item_categories, :categories  
  end
end
