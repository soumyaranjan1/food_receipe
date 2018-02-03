require 'test_helper'

class FoodReceipeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get food_receipe_index_url
    assert_response :success
  end

end
