require 'test_helper'

class CustomErrorControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
