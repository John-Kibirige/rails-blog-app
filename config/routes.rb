Rails.application.routes.draw do
  get 'posts/index'
  get 'posts/show'
  root "users#index"

  get 'users', to: "users#index"
  get "/users/:id", to: "users#show"
  get "/users/:id/posts", to: "posts#index"
  get "/users/:id/posts/:id", to: "posts#show"
end
