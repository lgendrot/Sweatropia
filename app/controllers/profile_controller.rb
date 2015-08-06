class ProfileController < ApplicationController
  before_filter :authenticate_user!, only: [:edit, :update]

	def show
		@profile = Profile.find(params[:id])

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
			redirect_to edit_profile_path
		end
	end

	private
		def profile_params
			params.require(:profile).permit(:bio)
		end



end