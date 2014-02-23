Blogelator::Engine.routes.draw do
  namespace :admin do
    resources :posts
  end
  get "/admin", to: "admin/posts#index"
  
  resources :posts, path: "/"
end
