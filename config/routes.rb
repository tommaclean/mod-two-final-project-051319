Rails.application.routes.draw do
  resources :playlist_songs, only: [:create, :destroy]
  resources :songs
  resources :playlists, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :djs, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :likes, only: [:create, :destroy]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
