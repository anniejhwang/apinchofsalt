Rails.application.routes.draw do
  get "/recipes" => "recipes#index"
  post "/recipes" => "recipes#create"
  get "/recipes/:id" => "recipes#show"
  patch "/recipes/:id" => "recipes#update"
  delete "/recipes/:id" => "recipes#destroy"

  get "/cuisines" => "cuisines#index"
  post "/cuisines" => "cuisines#create"
  get "/cuisines/:id" => "cuisines#show"
end
