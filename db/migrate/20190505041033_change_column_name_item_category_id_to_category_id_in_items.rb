class ChangeColumnNameItemCategoryIdToCategoryIdInItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :item_categories_id, :category_id
  end
end
