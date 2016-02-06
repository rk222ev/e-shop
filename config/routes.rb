Rails.application.routes.draw do
  root "products#index"

  devise_for :admins

  namespace :admin do
    root "pages#index"
    resources :products
    resources :admins
  end

  resources :products, only: [:index, :show]

end
