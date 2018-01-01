Rails.application.routes.draw do
  get '/' , to: 'users#create', as: 'root'
  get '/signup', to: 'users#new', as 'signup'
  get '/signin', to: 'sessions#new'
  post '/sessions' to: 'sessions#create'
  delete '/sessions' to: 'sessions#destroy'
  
  resources :users
  resources :bathrooms do
    resources :ratings
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
