class Api::TestController < ApplicationController
	respond_to :json

	def index
		respond_to do |format|
			format.json {
				respond_with current_user
			}
		end
	end
end
