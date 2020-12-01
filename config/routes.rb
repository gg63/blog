Rails.application.routes.draw do
  root 'homes#top'
  resources :posts , only: [:index, :new, :create, :show]
  resources :users
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end