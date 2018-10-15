taller_ebay.rb


### obtener token 

code = Base64.decode64(params["code"])    
# code = code[0..(code.size-2)]              
        
client_id = ENV.fetch('CLIENT_ID')

cert_id = ENV.fetch('CERT_ID')

authorization = Base64.encode64("#{client_id}:cert_id")
authorization = authorization[0..(authorization.size-2)]

url_base = "https://api.ebay.com/identity/v1/oauth2/token"

header    = {"Content-Type" => "application/x-www-form-urlencoded" ,
	"Authorization" => "Basic #{authorization}"}

parametros = {"grant_type"=>"authorization_code", "code"=>code, "redirect_uri" =>"https://ebayapp.herokuapp.com/token"}

response = HTTParty.post("#{url_base}", :query => parametros, :headers =>header)

res = JSON.parse response.body 


### traer item 

GET https://api.ebay.com/buy/browse/v1/item/{item_id}?
fieldgroups=string




# authorization = ENV.fetch('AUTHORIZATION')

authorization = EbayAuth.find(1).access_token

item_id = 322946328597
url_base = "https://api.ebay.com/buy/browse/v1/item/v1|#{item_id}|0"
url_base = URI.encode(url_base.strip)
header    = {"Content-Type" => "application/json" ,"Authorization" => "Bearer #{authorization}"}

parametros = {}
puts parametros

response = HTTParty.get("#{url_base}", :query => parametros, :headers =>header)

res = JSON.parse response.body


atributos = res["localizedAspects"]
upc = ""
atributos.each do |x|
if x["name"] =="UPC"
upc = x["value"]
end
end


### refrescar el token 





To do:


2) crear api para q en google script se mande el call al ebayapp y devuelva el upc 
3) crear funcion en google script para q haga el call y guarde el upc  NO SIRVE NO ES ESTABLE
3.2) Crear vista con table donde le pegas el url de ebay y se trae la info y te la completa
4) guardar otros atributos 
5) Mejorar vista del url
5.1) front end muestra q ya se guardo
6) boton para cargar lista de precios

productos = Product.where("upc is not null")
productos.each do |x|
costo = Cost.find_by_upc(x.upc)
if costo.present? 
x.cost = costo.precio_esp.to_f
x.gross_margin = x.current_price - costo.precio_esp
x.net_margin = (x.current_price.to_f*0.88)- 5 - costo.precio_esp.to_f
x.roi = ((x.net_margin + x.cost)/x.cost)-1
x.save 
end
end

7) cruzar via consola los upc existentes con la lista de precios 
8) crear password en params 
9) sacar calculos margen bruto, margen neto y roi 



10) si ya esta el url entonces no guardar
11) boton para agregar 100 mas
12) Paginate






