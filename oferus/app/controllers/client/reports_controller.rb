class Client::ReportsController < ApplicationController
  before_action :set_client_report, only: [:show, :edit, :update, :destroy]

  # GET /client/reports
  # GET /client/reports.json
  def index
    @client_reports = Client::Report.all
  end

  # GET /client/reports/1
  # GET /client/reports/1.json
  def show
  end

  # GET /client/reports/new
  def new
    @client_report = Client::Report.new
  end

  # GET /client/reports/1/edit
  def edit
  end

  # POST /client/reports
  # POST /client/reports.json
  def create
    @client_report = Client::Report.new(client_report_params)

    respond_to do |format|
      if @client_report.save
        format.html { redirect_to @client_report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @client_report }
      else
        format.html { render :new }
        format.json { render json: @client_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /client/reports/1
  # PATCH/PUT /client/reports/1.json
  def update
    respond_to do |format|
      if @client_report.update(client_report_params)
        format.html { redirect_to @client_report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @client_report }
      else
        format.html { render :edit }
        format.json { render json: @client_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /client/reports/1
  # DELETE /client/reports/1.json
  def destroy
    @client_report.destroy
    respond_to do |format|
      format.html { redirect_to client_reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_report
      @client_report = Client::Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_report_params
      params.fetch(:client_report, {})
    end
end
