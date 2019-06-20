class RoofShading < ApplicationRecord
	# Association
	has_one :lead, dependent: :destroy
end
