Rails.application.routes.draw do
  devise_for :users
  resources :images
  resources :users
  root to: "images#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
