class Api::CouponReservationsController < ApplicationController
	before_filter :coupon_reservation_params, only: [:create, :update]
	before_filter :check_method

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
	#metoda koja odgovara na GET /api/coupon_reservations/:id
	def show
	  respond_to do |format|
		format.any(:json, :xml) {
		  begin
		    # something which might raise an exception
			coupon_reservation = CouponReservation.find(params[:id])
		  rescue ActiveRecord::RecordNotFound
		    head :not_found
			return
			
		  end

		  respond_with coupon_reservation, status: :ok
		}
	  end
	end

	def update
		respond_to do |format|
			format.any(:json, :xml) {
				begin
		    		# something which might raise an exception
					coupon_reservation = CouponReservation.find(params[:id])
					coupon_reservation.update(@permitted)
		 		rescue ActiveRecord::RecordNotFound
		    		head :not_found
					return
		 		end

		 		head :no_content
		  		return
			}
		end
	end

		def destroy
		respond_to do |format|
			format.any(:json, :xml) {
				begin
		    		# something which might raise an exception
					coupon_reservation = CouponReservation.find(params[:id])
		  		rescue ActiveRecord::RecordNotFound
		    		head :not_found
					return
		  		end

		  		coupon_reservation.destroy
		  		head :no_content
		  		return
			}
		end
	end


	def create
		respond_to do |format|
			format.any(:json, :xml) {
				#The bang versions (e.g. save!) raise an exception if the record is invalid.
				coupon_reservation = CouponReservation.new(@permitted)			
				begin
					coupon_reservation.save(validate:false)
				rescue ActiveRecord::RecordInvalid
					head :bad_request
					return
				end

				head :created
				return
			}
		end
	end

private
	  def coupon_reservation_params
	 	 @permitted = params.require(:coupon_reservation).permit(:id, :user_id, :coupon_id, :checkup_code, :created_at, :updated_at)
	  end


	  def check_method
	  	# If you call render, head or redirect_to from a before_filter, the filter chain will be halted.
	  	# head  will respond to the request with only the HTTP response code, and the action will not execute.


	  	# Example invoking create with html format
	  	# Filter chain halted as :check_method rendered or redirected
        # Completed 405 Method Not Allowed in 2ms (ActiveRecord: 2.0ms)
	  	if request.format.html?
	  		head :method_not_allowed
	  	end
	  end

end
