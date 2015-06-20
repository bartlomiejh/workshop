Rails.application.routes.draw do
  mount Flip::Engine => "/flip"
  devise_for :users
  resources :categories do
    resources :products, except: :index do
      resources :reviews, only: [:create, :new]
    end
  end

  root 'categories#index'
end
