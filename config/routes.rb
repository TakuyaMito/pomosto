Rails.application.routes.draw do
  root 'tops#index'
  resources :lists, only: %i[new create edit update destroy] do
    resources :cards, except: %i[index]
  end

  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  get 'home', to: 'homes#index'
end