Rails.application.routes.draw do
  get 'likes/create'
  root 'users#index'

  get "users/:user_id/posts/new", to: "posts#new"
  post "users/:user_id/posts", to: "posts#create"

   resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

end
