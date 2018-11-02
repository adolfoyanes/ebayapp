class FrameWidth < ApplicationRecord
	has_many :models, dependent: :destroy
end
