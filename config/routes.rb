Rails.application.routes.draw do
  resources :team_pokemons, only: [:destroy]
  resources :pokemons
  resources :teams, only: [:new, :create, :destroy] do 
    resources :team_pokemons, only: [:new, :create]
  end
  resources :users do
    resources :teams, only: [:index, :show]
  end

  root 'welcome#home'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/index', to: 'users#index'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  post '/logout', to: 'sessions#destroy'

  get '/auth/google_oauth2/callback', to: 'sessions#omniauth'
  get '/search', to: 'pokemons#search', as: 'search'

end
