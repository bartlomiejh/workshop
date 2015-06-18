Rails.application.routes.draw do
  devise_for :users
  resources :categories do
    resources :products do
      resources :reviews, only: [:create, :new]
    end
  end

  root 'categories#index'
end
