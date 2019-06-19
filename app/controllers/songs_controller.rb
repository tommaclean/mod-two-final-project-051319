class SongsController < ApplicationController

  def index
    if !params[:search_term].emp
      @artists = RSpotify::Artist.search(params[:search_term])
    else
      redirect_to playlists_path
    end

  end
end
