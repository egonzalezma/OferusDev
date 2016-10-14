class DataController < ApplicationController
  
  API_BASE_URL_CLIENT = "http://mobile.isesa.cl:8810/Cliente/static/ClienteService.json"
  API_BASE_URL_CLIENT_ALL = "http://mobile.isesa.cl:8810/Cliente/rest/ClienteService/admstr?filter=ad_domain=\"itaka\""
  API_BASE_URL_PRODUCT = "http://mobile.isesa.cl:8810/ptmstr/static/ptmstrService.json"
  API_BASE_URL_PRODUCT_ALL = "http://mobile.isesa.cl:8810/ptmstr/rest/ptmstrService/ptmstr?filter=pt_domain=\"taka\""
  API_BASE_URL_SALE_NOTE = "http://mobile.isesa.cl:8810/NotaVenta/static/NotaVentaService.json"
  PATH_JSON_FILE_CLIENT = "/home/elitosdev/Escritorio/Oferus/Codigo/OferusDev/json test/ClientesItaka.json"
  PATH_JSON_FILE_PRODUCT ="/home/elitosdev/Escritorio/Oferus/Codigo/OferusDev/json test/ProductosItaka.json"

  before_action :set_datum, only: [:show, :edit, :update, :destroy]

  # GET /data
  # GET /data.json
  def index
    @data = Datum.all
    @data_client = RestClient.get(API_BASE_URL_CLIENT)
    @data_product = RestClient.get(API_BASE_URL_PRODUCT)
    @data_sale_note = RestClient.get(API_BASE_URL_SALE_NOTE)
    # @data_products = self.save_from_erp_product(nil)
    @data_clients = self.save_from_erp_client(nil)
    @data = @data_clients
  end

  # GET /data/1
  # GET /data/1.json
  def show
  end

  # GET /data/new
  def new
    @datum = Datum.new
  end

  # GET /data/1/edit
  def edit
  end

  # POST /data
  # POST /data.json
  def create
    @datum = Datum.new(datum_params)

    respond_to do |format|
      if @datum.save
        format.html { redirect_to @datum, notice: 'Datum was successfully created.' }
        format.json { render :show, status: :created, location: @datum }
      else
        format.html { render :new }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /data/1
  # PATCH/PUT /data/1.json
  def update
    respond_to do |format|
      if @datum.update(datum_params)
        format.html { redirect_to @datum, notice: 'Datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @datum }
      else
        format.html { render :edit }
        format.json { render json: @datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /data/1
  # DELETE /data/1.json
  def destroy
    @datum.destroy
    respond_to do |format|
      format.html { redirect_to data_url, notice: 'Datum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  

  # Public functions
  # Funcion para importar de ERP dato cliente a DataBase
  def save_from_erp_client (jsonClientList = nil)
    if jsonClientList == nil
       jsonClientList = File.read("#{PATH_JSON_FILE_CLIENT}")
    end    
    data_hash = JSON.parse(jsonClientList)
    data_hash_clients = data_hash["dsad_mstr"]
    data_hash_clients = data_hash_clients["ttad_mstr"]

    data_hash_clients.each do |client|
      @client = Client.new
      @client.id_client_to_client = client["ad_addr"]
      @client.save
    end

    return "Carga realizada con exito"

  end

  # Funcion para importar de ERP dato product a DataBase
  def save_from_erp_product (jsonProductList = nil)
    if jsonProductList == nil
       jsonProductList = File.read("#{PATH_JSON_FILE_PRODUCT}")
    end
    data_hash = JSON.parse(jsonProductList)
    data_hash_products = data_hash["dspt_mstr"]
    data_hash_products = data_hash_products["ttpt_mstr"]

    data_hash_products.each do |product|
      @product = Product.new
      @product.id_product_client = product["pt_part"]
      @product.save
    end

    return "Carga realizada con exito"
  
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datum_params
      params.fetch(:datum, {})
    end

  end
