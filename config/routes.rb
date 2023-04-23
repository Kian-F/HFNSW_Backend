Rails.application.routes.draw do
  resources :chirps
  post 'user/token' => 'user_token#create'
  get 'registrations/new'
  # scope '/auth' do
  #   post '/signin', to: 'user_token#create'
  #   post '/signup', to: 'users#create'
  # end
  get 'users/me' => 'users#me'

  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  root to: "statics#home"
  resources :users, :only => [:new, :create, :update, :index, :show, :destroy]
end
