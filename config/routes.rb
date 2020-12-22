Rails.application.routes.draw do
  root 'posts#index'
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :likes, only: [:create, :destroy]
  
  resources :users  do
    member do
      get :following,:followers
    end
  end 
  resources :follow_relationships, only: [:create, :destroy]
  
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  resources :profiles, only: [:show, :new, :create, :edit, :update]
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
