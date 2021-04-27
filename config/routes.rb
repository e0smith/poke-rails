Rails.application.routes.draw do
  resources :team_pokemons
  resources :pokemons, only: [:index, :show]
  resources :teams
  resources :users
  root 'welcome#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/index', to: 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  post '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'

  resources :pokemons, only: [:index, :show]
 
end
