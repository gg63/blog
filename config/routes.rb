Rails.application.routes.draw do
  root 'posts#index'
  resources :profiles, only: [:show, :new, :create, :edit, :update]
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :likes, only: [:create, :destroy]
  resources :users
  
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
