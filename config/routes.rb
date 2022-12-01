Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :pets do
    resources :bookings, only: [:create]
    resources :bookmarks, only: [:create]
  end
  resources :bookings, only: [:show, :new, :update, :destroy]
  get "/dashboard", to: "pages#dashboard"
  resources :bookmarks, only: [:new, :show, :destroy]
end
