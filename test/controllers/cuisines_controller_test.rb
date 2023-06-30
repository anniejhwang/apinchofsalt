require "test_helper"

class CuisinesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/cuisines.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Cuisine.count, data.length
  end

  test "create" do
    assert_difference "Cuisine.count", 1 do
      post "/cuisines.json", params: { name: "Indian" }
      assert_response 200
    end
  end
end
