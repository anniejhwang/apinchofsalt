require "test_helper"

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/recipes.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Recipe.count, data.length
  end

  test "create" do
    assert_difference "Recipe.count", 1 do
      post "/recipes.json", params: { title: "Americano", ingredients: "espresso, water, ice", prep_time: "1 min", cook_time: "2 mins", total_time: "3 mins", instructions: "Make an espresso and mix everything together with water and ice", image: "https://images.ctfassets.net/v601h1fyjgba/1vlXSpBbgUo9yLzh71tnOT/a1afdbe54a383d064576b5e628035f04/Iced_Americano.jpg", user_id: 1 }
      assert_response 200
    end
  end

  test "show" do
    get "/recipes/#{Recipe.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["id", "title", "ingredients", "prep_time", "cook_time", "total_time", "instructions", "created_at", "updated_at", "image", "user_id"], data.keys
  end

  test "update" do
    recipe = Recipe.first
    patch "/recipes/#{recipe.id}.json", params: { title: "Updated title", ingredients: "Updated ingredients", prep_time: "Updated prep_time", cook_time: "Updated cook_time", total_time: "Updated total_time", instructions: "Updated instructions", image: "Updated image", user_id: "Updated user_id" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
    assert_equal "Updated ingredients", data["ingredients"]
    assert_equal "Updated prep_time", data["prep_time"]
    assert_equal "Updated cook_time", data["cook_time"]
    assert_equal "Updated total_time", data["total_time"]
    assert_equal "Updated instructions", data["instructions"]
    assert_equal "Updated image", data["image"]
    assert_equal "Updated user_id", data["user_id"]
  end
  test "destroy" do
    assert_difference "Recipe.count", -1 do
      delete "/recipes/#{Recipe.first.id}.json"
      assert_response 200
    end
  end
end
