class EtsyController < ApplicationController
  
    
  def show
		@results = nil
		if params[:q]
			resp = Etsy::Request.get('/listings/active',
															 :includes => ['Images', 'Shop'],
															 :keywords => params[:q])
			#binding.pry
			@results = JSON.parse(resp.body)['results']
		end
		render :show
	end


	# def show
	# 	@results = nil
 #    Etsy.api_key = ETSY_API_TOKEN
	# 	resp = Etsy::Request.get('/listings/active', :includes => ['Images', 'Shop'], :keywords => 'beer')
	#   @results = JSON.parse(resp.body)['results']
	# end
	# puts @results

	# def show
	# 	@results = nil
	# 	Etsy.api_key = ETSY_API_TOKEN
	# 	@results = Etsy::Listing.find(217378316)
	# end
	# puts @results
end








