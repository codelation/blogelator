Blogelator::Engine.routes.draw do
  # Admin Routes with Ember.Router location: 'history' support
  get "/admin", to: "admin/posts#index"
  get "/admin/*path", to: "admin/posts#index"
  namespace :admin, path: "api" do
    resources :posts
  end
  
  # Public Routes
  resources :posts, path: "/"
  root to: "posts#index"
end
