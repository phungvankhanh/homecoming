Rails.application.routes.draw do
  get 'pagelist/index' 
  get 'destination/index' , to: 'destination#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
