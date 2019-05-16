class AddTotalInCentsToTransactions < ActiveRecord::Migration[5.2]
  def change
    add_column :transactions, :total_in_cents, :integer
  end
end
