Rails.application.routes.draw do
  root "products#index"

  devise_for :admins

  namespace :admin do
    root "pages#index"
    resources :products
    resources :admins, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :products, only: [:index, :show]

  resource :cart, only: [:show, :update, :destroy]

  post "checkout", to: "carts#checkout"

end
