require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "buscar funciona" do
    post :buscar, tag: 'futbol', access_token:'2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402' 
    assert_response :success
  end
end
