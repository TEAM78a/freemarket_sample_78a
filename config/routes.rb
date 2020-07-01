Rails.application.routes.draw do
  root 'items#index'

  resources :products do
    get 'confirmation', on: :member
  end
    
  resources :users, only: [:edit, :update, :show]

  resources :card, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end