Rails.application.routes.draw do
  root 'welcome#index'
  get 'worktimes', to: 'worktimes#index'
  get 'timer', to: 'worktimes#new'
end
