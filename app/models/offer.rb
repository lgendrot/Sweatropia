class Offer < ActiveRecord::Base

	# @offer = Offer.first
	# Remember that @offer.seller returns a Sweat class, to get the profile associated with it:
	# @offer.seller.profile
	
	belongs_to :seller , :class_name => "Sweat", :foreign_key => "sweat_id"
	belongs_to :buyer, :class_name => "Profile", :foreign_key => "profile_id"

	after_create :set_initial_state

	STATES = %w{ init pending accepted complete }

	STATES.each do |state|
		define_method("#{state}?") do
			self.state == state
		end

		define_method("#{state}!") do
			self.update_attribute(:state, state)
		end
	end

	private
		def set_initial_state
			self.update_attribute(:state, "init")
		end
end
