Rails.application.routes.draw do
  root 'homes#index'
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'top', to: 'tops#index'

  resources :lists, only: %i[new create edit update destroy] do
    resources :cards, except: %i[index]
  end

  resources :worktimes, only: %i[new create]
  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]
  resources :password_resets, only: %i[new create edit update]
end