class User::ReportsController < ApplicationController
  before_action :set_user_report, only: [:show, :edit, :update, :destroy]

  # GET /user/reports
  # GET /user/reports.json
  def index
    @user_reports = User::Report.all
  end

  # GET /user/reports/1
  # GET /user/reports/1.json
  def show
  end

  # GET /user/reports/new
  def new
    @user_report = User::Report.new
  end

  # GET /user/reports/1/edit
  def edit
  end

  # POST /user/reports
  # POST /user/reports.json
  def create
    @user_report = User::Report.new(user_report_params)

    respond_to do |format|
      if @user_report.save
        format.html { redirect_to @user_report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @user_report }
      else
        format.html { render :new }
        format.json { render json: @user_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user/reports/1
  # PATCH/PUT /user/reports/1.json
  def update
    respond_to do |format|
      if @user_report.update(user_report_params)
        format.html { redirect_to @user_report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_report }
      else
        format.html { render :edit }
        format.json { render json: @user_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user/reports/1
  # DELETE /user/reports/1.json
  def destroy
    @user_report.destroy
    respond_to do |format|
      format.html { redirect_to user_reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_report
      @user_report = User::Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_report_params
      params.fetch(:user_report, {})
    end
end
