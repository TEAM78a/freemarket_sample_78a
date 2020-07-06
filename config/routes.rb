Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'send_destinations', to: 'users/registrations#new_send_destination'
    post 'send_destinations', to: 'items#index'
  end
  root 'items#index'

  resources :products do
    get 'confirmation', on: :member
  end
    
  resources :users, only: [:edit, :update, :show]

  resources :card, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
