require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "get index" do
    get :index
    assert_response :success
  end
end
