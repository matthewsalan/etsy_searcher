class EtsyController < ApplicationController
  ETSY_API_TOKEN = ENV['ETSY_API_TOKEN']
    
  def show
		Etsy.api_key = ETSY_API_TOKEN
		@results = nil
		if params[:q]
			resp = Etsy::Request.get('listing/active',
															 :include => ['Images', 'Shop'],
															 :keywords => params[:q])
			@results = JSON.parse(resp.body)['results']
		end
		render :show
	end
end








