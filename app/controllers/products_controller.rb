class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  def productos
    @products = Product.all.order(id: :asc)
  end

  def cargar_listings
  end

  def traer_data
    puts "entramos en traer_data"
    puts params 
    salida = {}

    existe = Product.find_by_url(params["url"])
    if existe.nil?
      ebay_auth = EbayAuth.find(1)
      ## check expiration
      if (Time.now - ebay_auth.updated_at) >= 6600
        ## refresh token
        EbayAuth.refrescar_token(1)
        ebay_auth = EbayAuth.find(1)
      end

      authorization = EbayAuth.find(1).access_token

      url = params["url"]
      item_id = url.gsub("https://www.ebay.com/itm/-/", "")
      item_id = item_id[0..11]
      url_base = "https://api.ebay.com/buy/browse/v1/item/v1|#{item_id}|0"
      url_base = URI.encode(url_base.strip)
      header    = {"Content-Type" => "application/json" ,"Authorization" => "Bearer #{authorization}"}

      parametros = {}
      puts parametros

      response = HTTParty.get("#{url_base}", :query => parametros, :headers =>header)
      if response.code == 200 
        res = JSON.parse response.body
        puts res
        atributos = res["localizedAspects"]
        upc = "no hay UPC"
        # producto = Product.find(params["product_id"].gsub("product_", ""))
        producto = Product.new
        producto.name = res["title"]
        producto.current_price = res["price"]["value"]
        producto.url = url
        producto.upc = res["gtin"]
        if producto.upc.nil? && atributos.present? && atributos.size > 0
          atributos.each do |x|
            if x["name"] =="UPC"
              upc = x["value"]
              producto.upc = upc
            end
          end
        end
        producto.average_price = params["precio_tp"]
        producto.average_sold = params["ventas_tp"]
        if res["estimatedAvailabilities"].present? && res["estimatedAvailabilities"]["estimatedSoldQuantity"].present? 
          producto.total_sold = res["estimatedAvailabilities"]["estimatedSoldQuantity"]
        end
        producto.save
        if producto.upc.present? 
          x = producto 
          costo = Cost.find_by_upc(x.upc)
          if costo.present? 
            x.cost = costo.precio_esp.to_f
            x.gross_margin = x.current_price - costo.precio_esp
            x.net_margin = (x.current_price.to_f*0.88)- 5 - costo.precio_esp.to_f
            x.roi = ((x.net_margin + x.cost)/x.cost)-1
            x.save 
          end
        end
        salida["UPC"] = upc
      else
        puts response.code
        puts response.body
        salida["error"] = "item no encontrado"
      end
    else
      salida["error"] = "duplicado"
    end


    respond_to do |format|
      puts "entro en get items"
      puts salida
      format.json { render json: salida }
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:url, :upc, :current_price, :average_price, :cost, :gross_margin, :net_margin, :roi, :name, :total_sold, :average_sold)
    end
end
