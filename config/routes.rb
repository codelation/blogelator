Blogelator::Engine.routes.draw do
  namespace :admin do
    resources :posts, path: "/"
  end
  
  resources :posts, path: "/"
end
