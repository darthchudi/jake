Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  get "/user", to: "user#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
