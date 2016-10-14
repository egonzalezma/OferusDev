require 'test_helper'

class Office::ReportsControllerTest < ActionController::TestCase
  setup do
    @office_report = office_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:office_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create office_report" do
    assert_difference('Office::Report.count') do
      post :create, office_report: {  }
    end

    assert_redirected_to office_report_path(assigns(:office_report))
  end

  test "should show office_report" do
    get :show, id: @office_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @office_report
    assert_response :success
  end

  test "should update office_report" do
    patch :update, id: @office_report, office_report: {  }
    assert_redirected_to office_report_path(assigns(:office_report))
  end

  test "should destroy office_report" do
    assert_difference('Office::Report.count', -1) do
      delete :destroy, id: @office_report
    end

    assert_redirected_to office_reports_path
  end
end
