class CreateDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :details do |t|
      t.string :description
      t.decimal :price

      t.timestamps
    end
  end
end
