class DataController < ApplicationController
  require 'rest_client'
  
  API_BASE_URL_CLIENT = "http://mobile.isesa.cl:8810/Cliente/static/ClienteService.json"
  API_BASE_URL_CLIENT_ALL = "http://mobile.isesa.cl:8810/Cliente/rest/ClienteService/admstr?filter=ad_domain=\"itaka\""
  API_BASE_URL_PRODUCT = "http://mobile.isesa.cl:8810/ptmstr/static/ptmstrService.json"
  API_BASE_URL_PRODUCT_ALL = "http://mobile.isesa.cl:8810/ptmstr/rest/ptmstrService/ptmstr?filter=pt_domain=\"taka\""
  API_BASE_URL_SALE_NOTE = "http://mobile.isesa.cl:8810/NotaVenta/static/NotaVentaService.json"

  before_action :set_datum, only: [:show, :edit, :update, :destroy]

  # GET /data
  # GET /data.json
  def index
    @data = Datum.all
    @data_client = RestClient.get(API_BASE_URL_CLIENT)
    @data_product = RestClient.get(API_BASE_URL_PRODUCT)
    @data_sale_note = RestClient.get(API_BASE_URL_SALE_NOTE)
    @data = @data_client + @data_product + @data_sale_note
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_datum
      @datum = Datum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def datum_params
      params.fetch(:datum, {})
    end

    # Funcion para importar de ERP dato cliente a DataBase
    def save_from_erp_client
      
    end

    # Funcion para importar de ERP dato product a DataBase
    def save_from_erp_product
      
    end
end
