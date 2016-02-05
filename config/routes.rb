Rails.application.routes.draw do

  namespace :admin do
    root "pages#index"
    resources :products
  end

  devise_for :admins
end
