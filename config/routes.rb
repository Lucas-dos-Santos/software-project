Rails.application.routes.draw do
  resources :projects
  resources :activities
  root 'pages#dashboard'
  get 'projetos', to: 'pages#projects'
  get 'dashboard', to: 'pages#dashboard'
  get 'search', to: 'projects#search', as: :search
end
