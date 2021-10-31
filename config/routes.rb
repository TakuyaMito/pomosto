Rails.application.routes.draw do
  root 'worktimes#index'
  get 'timer', to: 'worktimes#new'

  resources :list, only: %i[new create]

  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
