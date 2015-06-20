Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :products, except: :index do
      resources :reviews, only: [:create, :new]
    end
  end

  resources :features, only: [:index] do
    resources :strategies, only: [:update, :destroy]
  end
  mount Flip::Engine => '/features'
  root 'categories#index'
end
