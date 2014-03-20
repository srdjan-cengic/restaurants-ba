class Api::CouponsController < ApplicationController
	before_filter :coupon_params, only: [:create, :update]
	before_filter :check_method
	# The head method can be used to send responses with only headers to the browser. 
	# It provides a more obvious alternative to calling render :nothing.


	# http://apidock.com/rails/ActionController/Base/render
	# http://stackoverflow.com/questions/2342579/http-status-code-for-update-and-delete
	# 405 = :method_not_allowed
	# 404 = :not_found
	# 200 = :ok
	# 201 = :created
	# 204 = :no_content


	# default is JSON format, set through routes
	# Respond to also allows you to specify a common block for different formats by using any:
	respond_to :json, :xml


	#metoda koja odgovara na GET /api/coupons
	def index
	  respond_to do |format|
	    format.any(:json, :xml) {
	      coupons = Coupon.all


		  if coupons.empty? 
		    head :not_found
		    return
		  end


		  respond_with coupons, status: :ok
	    }
	  end
	end

	#metoda koja odgovara na GET /api/coupons/:id
	def show
	  respond_to do |format|
		format.any(:json, :xml) {
		  begin
		    # something which might raise an exception
			coupon = Coupon.find(params[:id])
		  rescue ActiveRecord::RecordNotFound
		    head :not_found
			return
			#puts "Prosao sam dalje"
		  end


		  respond_with coupon, status: :ok
		}
	  end
	end


	def create
		respond_to do |format|
			format.any(:json, :xml) {
				#The bang versions (e.g. save!) raise an exception if the record is invalid.
				coupon = Coupon.new(@permitted)			
				begin
					coupon.save(validate:false)
				rescue ActiveRecord::RecordInvalid
					head :bad_request
					return
				end


				head :created
				return
			}
		end
	end
	# Be aware of: 
	# ActionController::InvalidAuthenticityToken (ActionController::InvalidAuthenticityToken)
	# 'Check to see who that client/IP is, it looks like they are using your site without 
	# loading your views.'


	#metoda koja odgovara na DELETE /api/coupons/:id
	def destroy
		respond_to do |format|
			format.any(:json, :xml) {
				begin
		    		# something which might raise an exception
					coupon = Coupon.find(params[:id])
		  		rescue ActiveRecord::RecordNotFound
		    		head :not_found
					return
		  		end


		  		coupon.destroy
		  		head :no_content
		  		return
			}
		end
	end


	private
	  def coupon_params
	 	 @permitted = params.require(:coupon).permit(:id, :description, :coupon_image, :number_of_available, :restaurant_id)
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


#The @Consumes annotation is used to specify which MIME media types of representations a resource can accept, or consume, from the client. 
#The @Produces annotation is used to specify the MIME media types or representations a resource can produce and send back to the client.