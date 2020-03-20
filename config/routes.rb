Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home', as: :home

  resources :hangouts do
    resources :hangout_chats, only: :show
    resources :hangout_messages, only: [:create, :edit, :update, :destroy]
    # Initial thought was message to be child of hangout_chats?
  end

  resources :friendships, only: [:new, :create, :edit, :update, :destroy]

  get '/settings', to: 'pages#mysettings', as: :mysettings
  patch '/toggle_availability', to: 'pages#toggle_availability', as: :toggle_availability

end
