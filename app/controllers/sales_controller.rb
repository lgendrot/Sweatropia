class SalesController < ApplicationController

	def index
	end

	def buy
		@sweat = Sweat.all
	end
end
