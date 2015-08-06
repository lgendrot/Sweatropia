class Profile < ActiveRecord::Base
	belongs_to :user
	has_one :sweat

	before_create :build_default_sweat

	def build_default_sweat
		build_sweat
		true
	end

end

