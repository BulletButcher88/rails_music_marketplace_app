Rails.application.routes.draw do
  root 'items#index'

  devise_for :users

  resources :categories, only: [:index, :show] do
    resources :items
  end

  resources :items do
    resources :item_reviews, only: [:new, :create, :edit, :update, :destroy]
    resources :transactions, only: [:new, :create]
  end

  resources :transactions, only: [:create] do
    resources :charges, only: [:new, :create]
    get '/successful_charge', to: 'charges#success', as: 'successful_charge'
  end
  

  resources :transactions, only: [:show, :edit, :update]  do
    resources :buyer_reviews, only: [:new, :create]
    resources :seller_reviews, only: [:new, :create]
  end

  resources :buyer_reviews, only: [:index, :show, :edit, :update, :destroy]
  resources :seller_reviews, only: [:index, :show, :edit, :update, :destroy]

end
