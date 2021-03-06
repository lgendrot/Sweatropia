class ProfileController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]

	def show
		@profile = Profile.find(params[:id])

		if @profile == current_user.profile
			@pending_offers = @profile.offers.where(state: "pending")
			@accepted_offers = @profile.offers.where(state:"accepted")
			@completed_offers = @profile.offers.where(state:"complete")
			@canceled_offers = @profile.offers.where(state:"canceled")

			@pending_sales = @profile.sweat.offers.where(state:"pending")
			@accepted_sales = @profile.sweat.offers.where(state:"accepted")
			@completed_sales = @profile.sweat.offers.where(state:"complete")
			@canceled_sales = @profile.sweat.offers.where(state:"canceled")
		end

		

		respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @user }
    end
	end

	def edit
		@profile = current_user.profile
	end



	def update
		@profile = current_user.profile
		if @profile.update_attributes(profile_params)
			flash[:info] = "Profile Updated"
			redirect_to @profile
		end
	end

	private
		def profile_params
			params.require(:profile).permit(:bio, :avatar)
		end

end
