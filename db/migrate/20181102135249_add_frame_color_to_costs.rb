class AddFrameColorToCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :costs, :frame_color, :string
  end
end
