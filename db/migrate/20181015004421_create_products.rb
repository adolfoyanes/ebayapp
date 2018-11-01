class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :url
      t.string :upc
      t.decimal :current_price
      t.decimal :average_price
      t.decimal :cost
      t.decimal :gross_margin
      t.decimal :net_margin
      t.decimal :roi
      t.string :name
      t.integer :total_sold
      t.integer :average_sold

      t.timestamps
    end
  end
end
