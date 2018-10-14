class EbayAuth < ApplicationRecord

	def self.refrescar_token(id)
		ebay_auth = EbayAuth.find(id)
		authorization = ENV.fetch('AUTHORIZATION')
		url_base = "https://api.ebay.com/identity/v1/oauth2/token"

		header    = {"Content-Type" => "application/x-www-form-urlencoded" ,"Authorization" => "Basic #{authorization}"}

		parametros = {"grant_type"=>"refresh_token", "refresh_token" => "#{ebay_auth.refresh_token}"}
		puts parametros

		response = HTTParty.post("#{url_base}", :query => parametros, :headers =>header)

		if response.code == 200
			res = JSON.parse response.body
	  	ebay_auth.access_token = res["access_token"]
	  	ebay_auth.token_type = res["token_type"]
	  	if ebay_auth.save 
	  		puts "se guardo bien "
	  	else
	  		puts "no se guardo nada"
	  	end
	  end

	end

end