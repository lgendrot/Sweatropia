class Profile < ActiveRecord::Base
	belongs_to :user
	has_one :sweat

	has_many :offers

	before_create :build_default_sweat
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "150x150>" }
	validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/




	def build_default_sweat
		build_sweat
		true
	end

end

