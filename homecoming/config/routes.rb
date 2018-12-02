Rails.application.routes.draw do
  get 'notifications/index'
  mount Ckeditor::Engine => '/ckeditor'
  root 'static_pages#index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'static_pages/home'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  get 'profile', to: 'user#show'

  resources :destinations do
    resources :reviews do
      resources :comments, only: [:create, :destroy, :update]
    end
  end
  resources :users
  resources :groups, only: [:new, :create, :show, :destroy] do
    resources :news
  end
  get '/search' => 'destinations#search', :as => 'search_page'
  get '/create_group' => 'tests#create_group'
  get '/show_group' => 'tests#show_group'
  get '/destroy_group' => 'tests#destroy_group'
  get '/add_member_to_group' => 'tests#add_member_to_group'

  mount ActionCable.server => '/cable'
end
