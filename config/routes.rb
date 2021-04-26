Rails.application.routes.draw do
  root 'welcome#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#logout'


  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  match '/auth/failure' => 'sessions#failure', via: [:get, :post]
end
