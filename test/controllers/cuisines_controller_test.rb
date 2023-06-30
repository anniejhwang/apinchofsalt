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

  test "show" do
    get "/cuisines/#{Cuisine.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "created_at", "updated_at"], data.keys
  end

  test "update" do
    cuisine = Cuisine.first
    patch "/cuisines/#{cuisine.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
  end

  test "destroy" do
    assert_difference "Cuisine.count", -1 do
      delete "/cuisines/#{Cuisine.first.id}.json"
      assert_response 200
    end
  end
end
