class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :name
      t.decimal :price
      t.integer :sizeId
      t.integer :detailId
      t.string :image
      t.string :dimensions

      t.timestamps
    end
  end
end
