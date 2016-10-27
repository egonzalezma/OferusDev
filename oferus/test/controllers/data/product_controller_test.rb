require 'test_helper'

class Data::ProductControllerTest < ActionController::TestCase
  test "should get load" do
    get :load
    assert_response :success
  end

end
