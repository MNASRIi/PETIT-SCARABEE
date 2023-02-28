Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lessons do
    resources :bookings, only: [:create]
  end
  resources :bookings, only: [:update, :destroy] do
    member do
      # patch "bookings/:id/accept"
      patch :accept
      # patch "bookings/:id/decline"
      patch :decline
      # patch "bookings/:id/cancel"
      patch :cancel
    end
  end

  # je recupere tous mes bookings
  get "mybookings", to: "pages#mybookings"
  # je recupere toutes mes lessons
  get "mylessons", to: "pages#mylessons"

  # je vais au dashboard
  get "dashboard", to: "pages#dashboard"
end
