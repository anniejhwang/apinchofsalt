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
    assert_equal ["id", "title", "ingredients", "prep_time", "cook_time", "total_time", "instructions", "image", "user_id", "created_at", "updated_at"], data.keys
  end

  test "update" do
    recipe = Recipe.first
    patch "/recipes/#{recipe.id}.json", params: { title: "Updated title" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated title", data["title"]
    assert_equal recipe.ingredients, data["ingredients"]
    assert_equal recipe.prep_time, data["prep_time"]
    assert_equal recipe.cook_time, data["cook_time"]
    assert_equal recipe.total_time, data["total_time"]
    assert_equal recipe.instructions, data["instructions"]
    assert_equal recipe.image, data["image"]
    assert_equal recipe.user_id, data["user_id"]
  end
  test "destroy" do
    assert_difference "Recipe.count", -1 do
      delete "/recipes/#{Recipe.first.id}.json"
      assert_response 200
    end
  end
end
