class AddPurchasedAtToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :purchased_at, :datetime
  end
end
