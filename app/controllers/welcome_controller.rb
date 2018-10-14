class WelcomeController < ApplicationController

	def index
	end

	def ebay_accept
		puts "entramos en ebay_accept"
		puts params 
		code = URI.decode(params["code"])  
		# code = code.gsub("\n", "")
		puts "el code es"
		puts code


		client_id = ENV.fetch('CLIENT_ID')
		cert_id = ENV.fetch('CERT_ID')



		authorization = Base64.strict_encode64("#{client_id}:#{cert_id}")
		puts authorization
		authorization = authorization.gsub("\n", "")
		puts "el authorization es"
		puts authorization

		authorization = ENV.fetch('AUTHORIZATION')


		url_base = "https://api.ebay.com/identity/v1/oauth2/token"

		header    = {"Content-Type" => "application/x-www-form-urlencoded" ,
			"Authorization" => "Basic #{authorization}"}

		parametros = {"grant_type"=>"authorization_code", "code"=>code, "redirect_uri" => "#{ENV.fetch('RU_NAME')}"}
		puts parametros

		response = HTTParty.post("#{url_base}", :query => parametros, :headers =>header)

		puts response.code

		res = JSON.parse response.body 

		puts res

		if response.code == 200
	  	ebay_auth = EbayAuth.new 
	  	ebay_auth.access_token = res["access_token"]
	  	ebay_auth.refresh_token = res["refresh_token"]
	  	ebay_auth.token_type = res["token_type"]
	  	if ebay_auth.save 
	  		puts "se guardo bien "
	  	else
	  		puts "no se guardo nada"
	  	end
	  end



	end
end
