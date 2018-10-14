taller_ebay.rb


### obtener token 


HTTP method:   POST
  URL (Sandbox): https://api.sandbox.ebay.com/identity/v1/oauth2/token

  HTTP headers:
    Content-Type = 
    Authorization = Basic <B64-encoded-oauth-credentials>





code = Base64.encode64(params["code"])    
code = code[0..(code.size-2)]              
        
client_id = ENV.fetch('CLIENT_ID')
client_id = Base64.encode64(client_id)
client_id = client_id[0..(client_id.size-2)]

url_base = "https://api.ebay.com/identity/v1/oauth2/token"

header    = {"Content-Type" => "application/x-www-form-urlencoded" ,
                     "Authorization" = "Basic #{client_id}"}

parametros = 

response = HTTParty.post("#{url_base}", :query => parametros, :headers =>header)

res = JSON.parse response.body 


### traer item 

GET https://api.ebay.com/buy/browse/v1/item/{item_id}?
fieldgroups=string

