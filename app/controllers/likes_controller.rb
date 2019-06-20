class LikesController < ApplicationController
  before_action :find_playlist, except: [:new]
  before_action :find_like, only: [:destroy]

  def new
  end

  def create
    if already_liked?
      @is_liked = true
      flash[:message] = "You can't like more than once"
    else
      @is_liked = false
      Like.create(dj_id: @current_dj.id, playlist_id: @playlist.id)
    end
    redirect_to @playlist
  end

  def destroy
    if !already_liked?
      flash[:message] = "can't unlike"
    else
    @like.destroy
    end
    redirect_to @playlist
  end

  private

  def already_liked?
    Like.where(dj_id: @current_dj.id, playlist_id: params[:playlist_id]).exists?
  end

  def find_like
    @like = @playlist.likes.find(params[:id])
  end

  def find_playlist
    @playlist = Playlist.find(params[:playlist_id])
  end

end
