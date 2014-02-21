Blogelator::Engine.routes.draw do
  resource :posts
  
  namespace :admin do
    resources :posts
  end
end
