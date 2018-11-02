class FrameColor < ApplicationRecord
	has_many :lens_colors
	belongs_to :model
end
