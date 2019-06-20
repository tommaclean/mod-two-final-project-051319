class ApplicationController < ActionController::Base
  before_action :find_dj
  before_action :authorized?

  def find_dj
    @dj_id = session[:dj_id]
    @logged_in = !!@dj_id
    if @logged_in
      @current_dj = Dj.find(@dj_id)
    end
  end

  def logout
    session[:dj_id] = nil
  end

  def authorized?
    unless @logged_in
      return redirect_to login_path
    end
  end

  def welcome
    # find_dj
    @liked_playlists = @dj.liked_playlists
    @playlists = @dj.playlists
  end
end
