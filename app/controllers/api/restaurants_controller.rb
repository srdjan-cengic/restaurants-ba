class Api::RestaurantsController < ApplicationController
	before_filter :restaurant_params, only: :create
	# The head method can be used to send responses with only headers to the browser. 
	# It provides a more obvious alternative to calling render :nothing.

	# http://apidock.com/rails/ActionController/Base/render
	# 405 = :method_not_allowed
	# 404 = :not_found
	# 200 = :ok
	# 201 = :created

	# default is JSON format, set through routes
	respond_to :json, :xml

	def index
	  respond_to do |format|
	    format.html { 
		  head :method_not_allowed
		  return
		}

	    format.any(:json, :xml) {
	      restaurants = Restaurant.all

		  if restaurants.empty? 
		    head :not_found
		    return
		  end

		  respond_with restaurants, status: :ok
	    }
	  end
	end

	def show
	  respond_to do |format|
	    format.html { 
		  head :method_not_allowed
		  return
		}

		format.any(:json, :xml) {
		  begin
		    # something which might raise an exception
			restaurant = Restaurant.find(params[:id])
		  rescue ActiveRecord::RecordNotFound
		    head :not_found
			return
		  end

		  respond_with restaurant, status: :ok
		}
	  end
	end

	# Be aware of: 
	# ActionController::InvalidAuthenticityToken (ActionController::InvalidAuthenticityToken)
	# 'Check to see who that client/IP is, it looks like they are using your site without 
	# loading your views.'
	def create
		respond_to do |format|
			format.html { 
			  head :method_not_allowed
			  return
			}

			format.any(:json, :xml) {
				#The bang versions (e.g. save!) raise an exception if the record is invalid.
				restourant = Restaurant.new(@permitted)
				
				begin
					restourant.save!
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
	  def restaurant_params
	    @permitted = params.require(:restaurant).permit(:name, :description, :telephone, :fb_page, :video_url)
	  end
end

#The @Consumes annotation is used to specify which MIME media types of representations a resource can accept, or consume, from the client. 
#The @Produces annotation is used to specify the MIME media types or representations a resource can produce and send back to the client.