Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'signup', to: 'users#new'
  
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  

  
  
  resources :users, only: [:index, :show, :create]
  
  
  resources :workposts do
    resources :comments, only: [:create, :destroy]
    resources :sends, only: [:create, :destory]
  end
  
end
