Rails.application.routes.draw do
  root 'items#index'

  resources :products do
    get 'confirmation', on: :member
  end
    
  resources :users, only: [:edit, :update, :show]

  resources :card, only: [:show, :edit, :update]

  get '/mypage' => 'items#mypage', as: 'mypage_path'
  get '/mypage/logout' => 'items#logout'

  namespace :mypage do
    resources :favorites, only:[:index]
    resources :listings, only: [:index]
    resources :users, only: [:edit, :update]
    resources :destinations, only: [:edit, :update]
    resources :cards, only: [:index, :new, :create, :destroy]
  end

end
