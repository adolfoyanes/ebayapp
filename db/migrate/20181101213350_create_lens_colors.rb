class CreateLensColors < ActiveRecord::Migration[5.2]
  def change
    create_table :lens_colors do |t|
      t.integer :frame_width_id
      t.integer :frame_color_id
      t.integer :model_id
      t.string :name

      t.timestamps
    end
  end
end
