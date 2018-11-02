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

	def self.get_by_upc()


		ebay_auth = EbayAuth.find(1)
		if (Time.now - ebay_auth.updated_at) >= 6600
      ## refresh token
      EbayAuth.refrescar_token(1)
      ebay_auth = EbayAuth.find(1)
    end

    authorization = EbayAuth.find(1).access_token


    productos = Product.all

		productos.each do |p|

			next if p.upc.nil? 
			puts "paso el next"
			puts p.upc
			next if p.upc.to_i == 0 
			ronda = 0
			for i in 0..1
				ronda = i
				upc = p.upc
				upc = "0" + upc if ronda == 1
				url_base = "https://api.ebay.com/buy/browse/v1/item_summary/search?sort=-price&gtin=#{upc}&filter=conditions:{NEW}&limit=100"
				url_base = URI.encode(url_base.strip)
				header    = {"Content-Type" => "application/json" ,"Authorization" => "Bearer #{authorization}"}

				parametros = {}
				puts parametros
				response = HTTParty.get("#{url_base}", :query => parametros, :headers =>header)
				res = JSON.parse response.body

				precios = []
				condiciones = []
				opciones = []

				if res["total"] > 0 
					res["itemSummaries"].each do |p|
						precios << p["price"]["value"].to_f
						condiciones << p["condition"]
						opciones << p["buyingOptions"]
					end
					indice = precios.index(precios.min)
					puts precios
					puts indice
					if ronda == 0 || (ronda == 1 && precios[indice] < p.current_price)
						p.current_price = precios[indice]
						p.url = res["itemSummaries"][indice]["itemWebUrl"]
						costo = Cost.find_by_upc(p.upc)
						if costo.present? 
							p.cost = costo.precio_esp.to_f
							p.gross_margin = p.current_price - costo.precio_esp
							p.net_margin = (p.current_price.to_f*0.88)- 5 - costo.precio_esp.to_f
							p.roi = ((p.net_margin + p.cost)/p.cost)-1
							p.save 
						end
					end
				end
			end ## cierra ronda
		end


	end

end