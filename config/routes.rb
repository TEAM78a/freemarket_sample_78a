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
    collection do
      get  'purchase/:id'=>  'products#purchase', as: 'purchase'
      post 'pay'=>   'products#pay', as: 'pay'
      get  'done'=>      'products#done', as: 'done'
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
