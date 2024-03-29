Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :golfclubs
  resources :reservations
  resources :mathnasium

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'reservations#index'
  get 'update_timeslots' => 'reservations#update_timeslots', as: 'update_timeslots'

  get 'sign_in' => 'users#sign_in'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
