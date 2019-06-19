Rails.application.routes.draw do
  resources :playlist_songs
  resources :songs
  resources :playlists
  resources :djs, only: [:show, :new, :create]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
