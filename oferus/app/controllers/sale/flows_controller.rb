class Sale::FlowsController < ApplicationController
  before_action :set_sale_flow, only: [:show, :edit, :update, :destroy]

  # GET /sale/flows
  # GET /sale/flows.json
  def index
    @sale_flows = Sale::Flow.all
  end

  # GET /sale/flows/1
  # GET /sale/flows/1.json
  def show
  end

  # GET /sale/flows/new
  def new
    @sale_flow = Sale::Flow.new
  end

  # GET /sale/flows/1/edit
  def edit
  end

  # POST /sale/flows
  # POST /sale/flows.json
  def create
    @sale_flow = Sale::Flow.new(sale_flow_params)

    respond_to do |format|
      if @sale_flow.save
        format.html { redirect_to @sale_flow, notice: 'Flow was successfully created.' }
        format.json { render :show, status: :created, location: @sale_flow }
      else
        format.html { render :new }
        format.json { render json: @sale_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sale/flows/1
  # PATCH/PUT /sale/flows/1.json
  def update
    respond_to do |format|
      if @sale_flow.update(sale_flow_params)
        format.html { redirect_to @sale_flow, notice: 'Flow was successfully updated.' }
        format.json { render :show, status: :ok, location: @sale_flow }
      else
        format.html { render :edit }
        format.json { render json: @sale_flow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sale/flows/1
  # DELETE /sale/flows/1.json
  def destroy
    @sale_flow.destroy
    respond_to do |format|
      format.html { redirect_to sale_flows_url, notice: 'Flow was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sale_flow
      @sale_flow = Sale::Flow.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sale_flow_params
      params.fetch(:sale_flow, {})
    end
end
