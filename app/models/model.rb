class Model < ApplicationRecord
	belongs_to :frame_width
	has_many :frame_colors
end
