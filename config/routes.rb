Blogelator::Engine.routes.draw do
  # Admin Routes Ember history location support
  get "/admin", to: "admin/posts#index"
  get "/admin/*path", to: "admin/posts#index"
  namespace :admin, path: "api" do
    resources :posts
  end
  
  # Public Routes
  resources :posts, path: "/"
  root to: "posts#index"
end
