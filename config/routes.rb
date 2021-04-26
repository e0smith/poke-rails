Rails.application.routes.draw do
  root 'welcome#home'
  get '/auth/google_oauth2/callback', to: 'sessions#create'
end
