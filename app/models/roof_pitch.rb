class RoofPitch < ApplicationRecord
	# Association
	has_one :lead, dependent: :destroy
end
