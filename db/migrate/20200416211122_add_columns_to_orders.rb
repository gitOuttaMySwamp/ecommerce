class AddColumnsToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :paid, :boolean
    add_column :orders, :stripeId, :integer
  end
end
