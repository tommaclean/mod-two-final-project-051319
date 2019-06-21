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
    @playlist = @current_dj.playlists.create(playlist_params(:name, :description))
    if @playlist.valid?
      redirect_to @playlist
    else
      flash[:errors] = @playlist.errors.full_messages
      redirect_to new_playlist_path
    end
  end

  def edit
    if @playlist.author.id != @current_dj.id
      redirect_to @playlist
    end
  end

  def update
    @playlist.update(playlist_params(:name, :description))
    if @playlist.valid?
      redirect_to @playlist
    else
      flash[:errors] = @playlist.errors.full_messages
      redirect_to edit_playlist_path
    end
  end

  def destroy
    @dj = Dj.find(@current_dj.id)
    @playlist.destroy
    redirect_to @dj
  end

  private

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def is_visitor_user?
    if @playlist.author.id == @current_dj.id
      return true
    end
  end

  def playlist_params(*args)
    params.require(:playlist).permit(*args)
  end


end
