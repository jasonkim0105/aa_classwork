Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users', to: 'users#index', as: 'users'
  post 'users', to: 'users#create'
  get 'users/:id', to: 'users#show', as: 'user'
  put 'users/:id', to: 'users#post'
  get 'users/new', to: 'users#new', as: 'new_user'
  get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  delete 'users/:id', to: 'users#destroy'
  patch 'users/:id', to: 'users#update'
end
