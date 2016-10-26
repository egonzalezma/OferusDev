class DataController < ApplicationController
  
  before_action :set_datum, only: [:show, :edit, :update, :destroy]

  # GET /data
  # GET /data.json
  def index
    @client_erp_successful = false;
    @product_erp_successful = false;
    @client_successful = false;
    @product_successful = false;

    ## Codigo de carga cliente
    begin
      @data_client = Client.get_all_clients()
      @data_clients = Client.save_from_erp_client(@data_client)
      @client_erp_successful = true
    rescue => ex
      logger.error ex.message
      @data_clients = Client.save_from_erp_client(nil)
      @client_successful = true
    end
    
    ## Codigo de carga producto
    begin
     @data_product = Product.get_all_products()
     data_products = Product.save_from_erp_product(@data_product)
     @product_erp_successful = true
    rescue => ex
      logger.error ex.message
      @data_products = Product.save_from_erp_product(nil)
      @product_successful = true
    end
    
    ## Mensaje de salida
    @message = ""
    if @client_successful 
      @message = @message + "Clientes cargados exitosamente desde archivo\n"
    elsif @client_erp_successful
      @message = @message + "Clientes cargados exitosamente desde ERP\n"
    end

    if @product_successful
      @message = @message + "Productos cargados exitosamente desde archivo\n"
    elsif @product_erp_successful
      @message = @message + "Productos cargados exitosamente desde ERP\n"
    end

    return @message  
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

  end
