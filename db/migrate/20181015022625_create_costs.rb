class CreateCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :costs do |t|
      t.string :brand
      t.string :type
      t.string :modelo
      t.string :color
      t.string :medida
      t.string :upc
      t.decimal :precio_esp

      t.timestamps
    end
  end
end
