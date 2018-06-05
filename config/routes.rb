Rails.application.routes.draw do
  root to: 'appointments#index'

  resources :bookings, only: [:new, :create]
end
