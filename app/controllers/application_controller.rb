class ApplicationController < ActionController::Base

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

end
