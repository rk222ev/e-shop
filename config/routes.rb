Rails.application.routes.draw do
  root "products#index"

  devise_for :admins

  namespace :admin do
    root "pages#index"
    resources :admins, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :products

    resources :orders do
      resources :order_rows, as: "row"
    end
  end

  resources :products, only: [:index, :show]
  resource :cart, only: [:show, :update, :destroy]
  resource :order, only: [:new, :create]
end
