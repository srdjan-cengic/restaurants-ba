class Api::SoapController < ApplicationController
	soap_service namespace: 'urn:WashOut'

	# Simple case
  	soap_action "integer_to_string",
              	:args   => :integer,
              	:return => :string
              	
  	def integer_to_string
    	render :soap => params[:value].to_s
  	end
end
