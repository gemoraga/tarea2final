require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "buscar funciona" do
    post :buscar, tag: 'futbol', access_token:'2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402' 
    assert_response :success
  end
  test "buscar exige parámetro tag" do
  post :buscar, access_token:'2019746130.59a3f2b.86a0135240404ed5b908a14c0a2d9402'
  assert_response 400
  end
  test "buscar exige parámetro access_token" do
  post :buscar, tag: 'futbol'
  assert_response 400
  end
end
