Rails.application.routes.draw do
  resources :articles
  root "application#hello" 
  get 'about', to: 'pages#about'
  get 'signup', to: 'users#new'
  get 'users', to: 'users#index', as: :users
  post 'users', to: 'users#create'
  get 'users/:id/edit', to: 'users#edit', as: :edit_user
  patch 'users/:id', to: 'users#update', as: :update_user
  get 'users/:id', to: 'users#show', as: :user
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'login', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
