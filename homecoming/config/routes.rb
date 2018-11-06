Rails.application.routes.draw do
  get 'static_pages/home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'profile', to: 'user#show'

  resources :destinations do
    resources :reviews do 
      resources :comments, only: [:create, :destroy]
    end
  end
  resources :users

end
