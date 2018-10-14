class EbayAuthsController < ApplicationController
  before_action :set_ebay_auth, only: [:show, :edit, :update, :destroy]

  # GET /ebay_auths
  # GET /ebay_auths.json
  def index
    @ebay_auths = EbayAuth.all
  end

  # GET /ebay_auths/1
  # GET /ebay_auths/1.json
  def show
  end

  # GET /ebay_auths/new
  def new
    @ebay_auth = EbayAuth.new
  end

  # GET /ebay_auths/1/edit
  def edit
  end

  def token
    puts "entramos en token "
    puts params 
  end

  def get_item

    password = ENV.fetch('PASSWORD')

    salida = {}

    if params["password"].present? && params["password"] == password

      ebay_auth = EbayAuth.find(1)
      ## check expiration
      if (Time.now - ebay_auth.updated_at) >= 6600
        ## refresh token
        EbayAuth.refresh_token(1)
        ebay_auth = EbayAuth.find(1)
      end

      authorization = EbayAuth.find(1).access_token

      item_id = params["item_id"]
      url_base = "https://api.ebay.com/buy/browse/v1/item/v1|#{item_id}|0"
      url_base = URI.encode(url_base.strip)
      header    = {"Content-Type" => "application/json" ,"Authorization" => "Bearer #{authorization}"}

      parametros = {}
      puts parametros

      response = HTTParty.get("#{url_base}", :query => parametros, :headers =>header)
      if response.code == 200 
        res = JSON.parse response.body
        atributos = res["localizedAspects"]
        upc = "no hay UPC"
        atributos.each do |x|
          if x["name"] =="UPC"
            upc = x["value"]
          end
        end

        salida["UPC"] = upc
      else
        salida["error"] = "item no encontrado"
      end
    else
      salida["error"] = "Acceso no autorizado"
    end

    respond_to do |format|
      puts "entro en view customers"
      format.json { render json: salida }
    end
  end

  # POST /ebay_auths
  # POST /ebay_auths.json
  def create
    @ebay_auth = EbayAuth.new(ebay_auth_params)

    respond_to do |format|
      if @ebay_auth.save
        format.html { redirect_to @ebay_auth, notice: 'Ebay auth was successfully created.' }
        format.json { render :show, status: :created, location: @ebay_auth }
      else
        format.html { render :new }
        format.json { render json: @ebay_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebay_auths/1
  # PATCH/PUT /ebay_auths/1.json
  def update
    respond_to do |format|
      if @ebay_auth.update(ebay_auth_params)
        format.html { redirect_to @ebay_auth, notice: 'Ebay auth was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebay_auth }
      else
        format.html { render :edit }
        format.json { render json: @ebay_auth.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebay_auths/1
  # DELETE /ebay_auths/1.json
  def destroy
    @ebay_auth.destroy
    respond_to do |format|
      format.html { redirect_to ebay_auths_url, notice: 'Ebay auth was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebay_auth
      @ebay_auth = EbayAuth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebay_auth_params
      params.require(:ebay_auth).permit(:user_id, :access_token, :refresh_token, :expiration, :token_type)
    end
end
