class OffersController < ApplicationController

	def create
		@offer = Offer.new(offer_params)
		if @offer.save
			
			Notification.create(recipient_id: @offer.seller.profile.id, 
													sender_id: @offer.buyer.id, 
													offer_id: @offer.id, 
													notification_type: "new_offer")

			redirect_to @offer.seller.profile
			flash[:alert] = "Offer successfully created"
		else
			render 'new'
		end
	end

	private
		def offer_params
			params.require(:offer).permit(:amount, :profile_id, :sweat_id)
		end
end
