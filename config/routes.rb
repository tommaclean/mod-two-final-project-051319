Rails.application.routes.draw do

  resources :likes, only: [:create, :delete]
  resources :playlist_songs, only: [:create, :delete]
  resources :songs
  resources :playlists
  resources :djs, only: [:show, :new, :create, :edit, :update, :destroy]

  root "application#welcome"
  get '/welcome/:id', to: 'application#welcome'
  get '/playlists', to: 'playlists#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
