class LensColor < ApplicationRecord
	has_many :lens_materials
	belongs_to :frame_color
end
