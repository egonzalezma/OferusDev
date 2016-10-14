class Office::ReportsController < ApplicationController
  before_action :set_office_report, only: [:show, :edit, :update, :destroy]

  # GET /office/reports
  # GET /office/reports.json
  def index
    @office_reports = Office::Report.all
  end

  # GET /office/reports/1
  # GET /office/reports/1.json
  def show
  end

  # GET /office/reports/new
  def new
    @office_report = Office::Report.new
  end

  # GET /office/reports/1/edit
  def edit
  end

  # POST /office/reports
  # POST /office/reports.json
  def create
    @office_report = Office::Report.new(office_report_params)

    respond_to do |format|
      if @office_report.save
        format.html { redirect_to @office_report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @office_report }
      else
        format.html { render :new }
        format.json { render json: @office_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office/reports/1
  # PATCH/PUT /office/reports/1.json
  def update
    respond_to do |format|
      if @office_report.update(office_report_params)
        format.html { redirect_to @office_report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_report }
      else
        format.html { render :edit }
        format.json { render json: @office_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office/reports/1
  # DELETE /office/reports/1.json
  def destroy
    @office_report.destroy
    respond_to do |format|
      format.html { redirect_to office_reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_report
      @office_report = Office::Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_report_params
      params.fetch(:office_report, {})
    end
end
