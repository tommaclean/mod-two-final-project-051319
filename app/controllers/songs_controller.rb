class SongsController < ApplicationController

  def index
    if !params[:search_term].empty?
      RSpotify.authenticate("a1e5a4bb89144addae8adeaf3ef07f01", "b786b2ff6ab94053bb52c3bb95a591bb")
      # Track search results
      track_search = RSpotify::Track.search(params[:search_term])
      @track_results = track_search.map.take(4)  { |track| {name: track.name, artists: track.artists.map{|a| a.name}, preview: track.preview_url, bpm: track.artists.map {|a| a.audio_features.tempo} }}
      # Artist search results
      artist_search = RSpotify::Artist.search(params[:search_term])
      @artist_results = artist_search.map.take(4)  { |artist| artist.name }
      # Albums search resultss
      album_search = RSpotify::Album.search(params[:search_term])
      @album_results = album_search.map.take(4)  { |album| {title: album.name, artist: album.artists.first.name}}
      # Playlist search results
      playlists_search = RSpotify::Playlist.search(params[:search_term])
      @spotify_playlist_results = playlists_search.map.take(4) { |playlist| {name: playlist.name, author: playlist.owner.display_name}}
      # Local playlists
      @playlist_results = Playlist.where('name LIKE ?', "%#{params[:search_term]}%")
      # User search results
      @users_results = Dj.where('username LIKE ?', "%#{params[:search_term]}%")
      # byebug
    else
      redirect_to playlists_path
    end
  end

end
