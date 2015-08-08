class Sweat < ActiveRecord::Base
	belongs_to :profile
	has_many :offers
end
