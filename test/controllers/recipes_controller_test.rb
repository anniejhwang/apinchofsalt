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
      post "/users.json", params: { name: "Test", email: "test@test.com", password: "password", password_confirmation: "password" }
      post "/sessions.json", params: { email: "test@test.com", password: "password" }
      data = JSON.parse(response.body)
      token = data["jwt"]

      post "/recipes.json", params: { title: "Americano", ingredients: "coffee", prep_time: "1 min", cook_time: "2 mins", total_time: "3 mins", instructions: "Mix", image: "test.jpg", user_id: 1 }, headers: { Authorization: "Bearer #{token}" }
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
  end
  test "destroy" do
    assert_difference "Recipe.count", -1 do
      delete "/recipes/#{Recipe.first.id}.json"
      assert_response 200
    end
  end
end
