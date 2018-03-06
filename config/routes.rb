Rails.application.routes.draw do

  devise_for :users

  resources :products, only: :index do
    resources :orders, only: :create
  end

  resources :orders, only: [:index, :destroy] do
    collection do
      delete 'empty_cart'
    end
  end

  root 'products#index'

end
