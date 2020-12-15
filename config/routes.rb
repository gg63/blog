Rails.application.routes.draw do
  root 'posts#index'
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
  end
  resources :likes, only: [:create, :destroy]
  
  resources :users do
    member do 
      get :following, :followers
    end
  end
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  
  resources :profiles, only: [:show, :new, :create, :edit, :update]
  resources :follows, only:[:create, :destroy]
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
