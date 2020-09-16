Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#new'
  resources :posts, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  
end
