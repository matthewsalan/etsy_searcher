class EtsySearchControllerController < ApplicationController
	ETSY_API_TOKEN = ENV['ETSY_API_TOKEN']

	def search
		Etsy.api_token = ETSY_API_TOKEN
		@results = nill
		if params[:q]
			resp = Etsy::Request.get('listing/active',
															 :include => ['Images', 'Shop'],
															 :keywords => params[:q])
			@results = JSON.parse(resp.body)['results']
		end
		render :search
	end
end



