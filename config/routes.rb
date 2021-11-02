Rails.application.routes.draw do
  # root 'worktimes#index'
  root 'tops#index'
  get 'timer', to: 'worktimes#new'

  resources :lists, only: %i[new create edit update destroy] do
    resources :cards, only: %i[new create show edit update]
  end

  resources :users, only: %i[new create]
  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
end
