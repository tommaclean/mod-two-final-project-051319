class PlaylistSongsController < ApplicationController

  def show
    #code
  end

  def create
    # byebug
    @playlist_song = PlaylistSong.create(song_id: params[:playlist_song][:song_id], playlist_id: @current_dj.playlists.last.id)

    redirect_to @current_dj.playlists.last
  end

  def destroy
    @playlist_song = PlaylistSong.find_by(song_id: params[:id], playlist_id: params[:format])
    @playlist = @playlist_song.playlist
    @playlist_song.destroy

    redirect_to @playlist
  end

end
