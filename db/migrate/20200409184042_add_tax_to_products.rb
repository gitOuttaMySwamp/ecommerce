class AddTaxToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :tax, :decimal
  end
end
