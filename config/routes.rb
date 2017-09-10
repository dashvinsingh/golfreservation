Rails.application.routes.draw do
  mount Blazer::Engine, at: "blazer"

  devise_for :users
  resources :golfclubs
  resources :reservations

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)



  root to: 'reservations#index'
  get 'update_timeslots' => 'reservations#update_timeslots', as: 'update_timeslots'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
