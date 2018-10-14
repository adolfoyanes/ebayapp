taller_ebay.rb


### obtener token 

code = Base64.encode64(params["code"])    
code = code[0..(code.size-2)]              
        
client_id = ENV.fetch('CLIENT_ID')

cert_id = ENV.fetch('CERT_ID')


authorization = Base64.encode64("#{client_id}:cert_id")
authorization = authorization[0..(authorization.size-2)]

url_base = "https://api.ebay.com/identity/v1/oauth2/token"

header    = {"Content-Type" => "application/x-www-form-urlencoded" ,
                     "Authorization" = "Basic #{authorization}"}

parametros = {
				"grant_type"=>"authorization_code", 
				"code"=>code, 
				"redirect_uri" =>"<%= url_for token_path %>"
				}

response = HTTParty.post("#{url_base}", :query => parametros, :headers =>header)

res = JSON.parse response.body 


### traer item 

GET https://api.ebay.com/buy/browse/v1/item/{item_id}?
fieldgroups=string

