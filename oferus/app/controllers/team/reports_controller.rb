class Team::ReportsController < ApplicationController
  before_action :set_team_report, only: [:show, :edit, :update, :destroy]

  # GET /team/reports
  # GET /team/reports.json
  def index
    @team_reports = Team::Report.all
  end

  # GET /team/reports/1
  # GET /team/reports/1.json
  def show
  end

  # GET /team/reports/new
  def new
    @team_report = Team::Report.new
  end

  # GET /team/reports/1/edit
  def edit
  end

  # POST /team/reports
  # POST /team/reports.json
  def create
    @team_report = Team::Report.new(team_report_params)

    respond_to do |format|
      if @team_report.save
        format.html { redirect_to @team_report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @team_report }
      else
        format.html { render :new }
        format.json { render json: @team_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /team/reports/1
  # PATCH/PUT /team/reports/1.json
  def update
    respond_to do |format|
      if @team_report.update(team_report_params)
        format.html { redirect_to @team_report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @team_report }
      else
        format.html { render :edit }
        format.json { render json: @team_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /team/reports/1
  # DELETE /team/reports/1.json
  def destroy
    @team_report.destroy
    respond_to do |format|
      format.html { redirect_to team_reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team_report
      @team_report = Team::Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def team_report_params
      params.fetch(:team_report, {})
    end
end
