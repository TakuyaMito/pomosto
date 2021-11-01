Rails.application.routes.draw do
  # root 'worktimes#index'
  root 'tops#index'
  get 'timer', to: 'worktimes#new'

  resources :list, only: %i[new create edit update destroy]

  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
