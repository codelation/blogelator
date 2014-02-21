Blogelator::Engine.routes.draw do
  resources :posts, path: "/"
  
  namespace :admin do
    resources :posts, path: "/"
  end
end
