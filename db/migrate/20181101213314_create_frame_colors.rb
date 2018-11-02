class CreateFrameColors < ActiveRecord::Migration[5.2]
  def change
    create_table :frame_colors do |t|
      t.integer :frame_width_id
      t.integer :model_id
      t.string :name

      t.timestamps
    end
  end
end
