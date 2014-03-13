class Api::RestaurantsController < ApplicationController
	# The head method can be used to send responses with only headers to the browser. 
	# It provides a more obvious alternative to calling render :nothing.

	# http://apidock.com/rails/ActionController/Base/render
	# 405 = :method_not_allowed
	# 404 = :not_found
	# 200 = :ok

	# default JSON format
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
end
