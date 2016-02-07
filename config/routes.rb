Rails.application.routes.draw do
  root "products#index"

  devise_for :admins

  namespace :admin do
    root "pages#index"
    resources :admins, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :orders
    resources :products
  end

  resources :products, only: [:index, :show]
  resource :cart, only: [:show, :update, :destroy]
  resource :checkout, only: [:show, :update]
end
