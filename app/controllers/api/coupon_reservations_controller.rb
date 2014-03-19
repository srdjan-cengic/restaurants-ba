class Api::CouponReservationsController < ApplicationController

 	#default is JSON format, set through routes
	# Respond to also allows you to specify a common block for different formats by using any:
	respond_to :json, :xml

	def index
	  respond_to do |format|
	    format.any(:json, :xml) {
	      coupon_reservations = CouponReservation.all

		  if coupon_reservations.empty? 
		    head :not_found
		    return
		  end

		  respond_with coupon_reservations, status: :ok
	    }
	  end
	end
end
