require 'test_helper'

class Sale::FlowsControllerTest < ActionController::TestCase
  setup do
    @sale_flow = sale_flows(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sale_flows)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale_flow" do
    assert_difference('Sale::Flow.count') do
      post :create, sale_flow: {  }
    end

    assert_redirected_to sale_flow_path(assigns(:sale_flow))
  end

  test "should show sale_flow" do
    get :show, id: @sale_flow
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale_flow
    assert_response :success
  end

  test "should update sale_flow" do
    patch :update, id: @sale_flow, sale_flow: {  }
    assert_redirected_to sale_flow_path(assigns(:sale_flow))
  end

  test "should destroy sale_flow" do
    assert_difference('Sale::Flow.count', -1) do
      delete :destroy, id: @sale_flow
    end

    assert_redirected_to sale_flows_path
  end
end
