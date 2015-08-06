class SweatsController < ApplicationController
	before_filter :authenticate_user!

	def show
		@sweat = current_user.sweat
	end

	def edit
		@sweat = current_user.sweat
	end

	def update
		@sweat = current_user.sweat
		if @sweat.update_attributes(sweat_params)
			flash[:info] = "Sweat Shop Updated"
			redirect_to sell_path
		end
	end

	private
		def sweat_params
			params.require(:sweat).permit(:amount)
		end

end
