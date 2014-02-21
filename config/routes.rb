Blogelator::Engine.routes.draw do
  namespace :admin do
    resources :posts
  end

end
