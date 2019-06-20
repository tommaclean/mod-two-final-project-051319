class PlaylistsController < ApplicationController
  skip_before_action :authorized?, only: [:index, :show, :new, :create, :edit, :udpate, :delete]
  before_action :find_playlist, only: [:show, :edit, :update, :destroy]

 def index
   @playlists = Playlist.all
 end

  def show
  end

  def new
    @playlist = Playlist.new
  end

  def create
    @dj =
    @playlist = Playlist.create(playlist_params(:name, :description, dj_id: @current_user.id))
    if @playlist.valid?
      redirect_to @playlist
    else
      flash[:errors] = @playlist.errors.full_messages
      redirect_to new_playlist_path
    end
  end

  def edit

  end

  def update
    @playlist.update(dj_params(:name, :description))
    if @playlist.valid?
      redirect_to @playlist
    else
      flash[:errors] = @playlist.errors.full_messages
      redirect_to edit_playlist_path
    end
  end

  def delete
    @dj = @playlist.dj
    @playlist.destroy
    redirect_to @dj
  end

  private

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params(*args)
    params.require(:dj).permit(*args)
  end


end
