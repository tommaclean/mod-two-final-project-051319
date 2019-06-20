class PlaylistSongsController < ApplicationController

  def show
    #code
  end

  def create
    #code
  end

  def destroy
    @playlist_song = PlaylistSong.find(params[:id])
    @playlist = @playlist_song.playlist
    @playlist_song.destroy

    redirect_to @playlist
  end

end
