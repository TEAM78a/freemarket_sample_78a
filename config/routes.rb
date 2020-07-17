Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  devise_scope :user do
    get 'send_destinations', to: 'users/registrations#new_send_destination'
    post 'send_destinations', to: 'users/registrations#create_send_destination'
  end
  root 'items#index'

  resources :products do
    resources :comments, only: [:create]
    collection do
      get  'purchase/:id', to: 'products#purchase', as: 'purchase'
      post 'pay/:id', to: 'products#pay', as: 'pay'
      get  'done', to: 'products#done', as: 'done'
    end
  end

  get '/mypage', to: 'items#mypage'
  get '/mypage/logout', to: 'items#logout'
  namespace :mypage do
    resources :favorites, only:[:index]
    resources :listings, only: [:index]
    resources :purchasers, only: [:index]
    resources :users, only: [:edit, :update]
    resources :destinations, only: [:edit, :update]
    resources :cards, only: [:index, :new, :create, :destroy] do
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
