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
    resources :confirmations, only: [:index, :new, :create, :edit, :update]
    collection do
      get :search
    end
  end

  get '/mypage' => 'items#mypage'
  get '/mypage/logout' => 'items#logout'
  namespace :mypage do
    resources :favorites, only:[:index]
    resources :listings, only: [:index]
    resources :purchasers, only: [:index]
    resources :users, only: [:edit, :update]
    resources :destinations, only: [:edit, :update]
    resources :cards, only: [:index, :new, :create, :destroy]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
