require 'test_helper'

class Client::ReportsControllerTest < ActionController::TestCase
  setup do
    @client_report = client_reports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:client_reports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create client_report" do
    assert_difference('Client::Report.count') do
      post :create, client_report: {  }
    end

    assert_redirected_to client_report_path(assigns(:client_report))
  end

  test "should show client_report" do
    get :show, id: @client_report
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @client_report
    assert_response :success
  end

  test "should update client_report" do
    patch :update, id: @client_report, client_report: {  }
    assert_redirected_to client_report_path(assigns(:client_report))
  end

  test "should destroy client_report" do
    assert_difference('Client::Report.count', -1) do
      delete :destroy, id: @client_report
    end

    assert_redirected_to client_reports_path
  end
end
