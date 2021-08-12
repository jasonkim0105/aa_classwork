Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only:[:index, :show, :create, :update, :destroy]
  resources :artworks, only:[:show, :create, :update, :destroy]
  resources :artwork_shares, only:[:create, :destroy]

  resources :users do
    resources :artworks, only:[:index]
  end


  resources :comments, only:[:create, :destroy, :index]
end
