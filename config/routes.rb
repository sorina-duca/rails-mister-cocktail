Rails.application.routes.draw do
  devise_for :users
  root to: 'cocktails#index'
  resources :cocktails, only: [:show, :new, :create] do
    resources :doses, only: [:new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
end
