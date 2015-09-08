Blogelator::Engine.routes.draw do
  # Admin Routes with Ember.Router location: 'history' support
  get "/", to: "admin/posts#index", as: "admin"
  get "/*path", to: "admin/posts#index"
  namespace :admin, path: "api", as: "api" do
    resources :images
    resources :posts
  end
  root to: "admin/posts#index"
end
