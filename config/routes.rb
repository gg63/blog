Rails.application.routes.draw do
  root 'homes#top'
  resource :user, only: [:new, :create, :show]
  get 'login', to: "sessions#new"
  post 'login', to: "ssesions#create"
  delete 'logout', to: "ssesions#destroy"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
