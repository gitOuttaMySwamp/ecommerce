class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :productId
      t.references :user, null: false, foreign_key: true
      t.decimal :amount

      t.timestamps
    end
  end
end
