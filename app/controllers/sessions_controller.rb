class SessionsController < ApplicationController
  def new
    #code
  end

  def create
    @dj = Dj.find_by(username: params[:username])
    if @dj && @dj.authenticate(params[:password])
      flash[:messages] = "Welcome back #{@dj.name}"
      session[:dj_id] = @dj.id
      redirect_to @dj
    else
      flash[:messages] = "Incorrect username or password"
      redirect_to login_path
    end
  end

  def destroy
    logout
    redirect_to login_path
  end

end
