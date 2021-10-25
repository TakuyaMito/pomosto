Rails.application.routes.draw do
  root 'worktimes#index'
  get 'timer', to: 'worktimes#new'
  resources :users, only: %i[new create]
end
