class ChangeColumnNameUsersStripeidToStripeId < ActiveRecord::Migration[5.2]
  def change
    rename_column :users, :stripeid, :stripe_id
  end
end
