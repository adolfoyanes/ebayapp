class WelcomeController < ApplicationController

	def index
	end

	def ebay_accept
		puts "entramos en ebay_accept"
		puts params 
		code = Base64.decode64(params["code"])  
		puts "el code es"
		puts code


		client_id = ENV.fetch('CLIENT_ID')

		cert_id = ENV.fetch('CERT_ID')

		authorization = Base64.encode64("#{client_id}:cert_id")
		authorization = authorization[0..(authorization.size-2)]

		puts "el authorization es"

		url_base = "https://api.ebay.com/identity/v1/oauth2/token"

		header    = {"Content-Type" => "application/x-www-form-urlencoded" ,
			"Authorization" => "Basic #{authorization}"}

		parametros = {"grant_type"=>"authorization_code", "code"=>code, "redirect_uri" =>"<%= url_for token_path %> "}

		response = HTTParty.post("#{url_base}", :query => parametros, :headers =>header)

		res = JSON.parse response.body 


	end
end
