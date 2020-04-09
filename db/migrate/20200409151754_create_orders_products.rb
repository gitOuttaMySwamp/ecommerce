class CreateOrdersProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :orders_products, id: false do |t|
      t.belongs_to :order, index: true
      t.belongs_to :piece, index: true
      t.timestamps
    end
  end
end
