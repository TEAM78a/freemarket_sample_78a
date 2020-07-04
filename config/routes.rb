Rails.application.routes.draw do
  root 'items#index'

  resources :products do
    get 'confirmation', on: :member
  end
    
  resources :users, only: [:edit, :update, :show]

  resources :card, only: [:show, :edit, :update]

  get '/mypage' => 'items#mypage', as: 'mypage_path'
  namespace :mypage do
    resources :favorites, only:[:index]
    resources :listings, only: [:index]
    resources :users, only: [:show, :edit, :update]
    resources :address, only: [:index, :edit, :update]
    resources :card, only: [:index, :new, :create, :edit, :update, :destroy]
  end

end
