class UpdateColumnOrder < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :stripeId, :string
  end
end
