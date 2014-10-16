require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  test "should get update" do
    get :update
    assert_response :success
  end

end
