Rails.application.routes.draw do

  namespace :admin do
    root "pages#index"
    resource :products
  end

  devise_for :admins

end
