Rails.application.routes.draw do
  get 'registrations/new'
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  root to: "statics#home"
  resources :users, :only => [:new, :create, :index, :show]
  get 'users/new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
