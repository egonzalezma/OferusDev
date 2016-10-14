require 'test_helper'

class Team::ReportsControllerTest < ActionController::TestCase
  setup do
    @team_report = team_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:team_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create team_report" do
    assert_difference('Team::Report.count') do
      post :create, team_report: {  }
    end

    assert_redirected_to team_report_path(assigns(:team_report))
  end

  test "should show team_report" do
    get :show, id: @team_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @team_report
    assert_response :success
  end

  test "should update team_report" do
    patch :update, id: @team_report, team_report: {  }
    assert_redirected_to team_report_path(assigns(:team_report))
  end

  test "should destroy team_report" do
    assert_difference('Team::Report.count', -1) do
      delete :destroy, id: @team_report
    end

    assert_redirected_to team_reports_path
  end
end
