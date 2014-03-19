class Api::CouponReservationController < ApplicationController

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
