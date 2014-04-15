Blogelator::Engine.routes.draw do
  # Admin Routes with Ember.Router location: 'history' support
  get "/admin", to: "admin/posts#index", as: "admin"
  get "/admin/*path", to: "admin/posts#index"
  namespace :admin, path: "api", as: "api" do
    resources :images
    resources :posts
  end

  # Public Routes
  resources :posts, path: "/" do
    get "/page/:page", action: "index", on: :collection
  end
  root to: "posts#index"
end
