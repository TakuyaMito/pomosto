Rails.application.routes.draw do
  root 'welcome#index'
  get 'worktimes', to: 'worktimes#index'
end
