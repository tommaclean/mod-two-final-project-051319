class SessionsController < ApplicationController
  skip_before_action :authorized?, only: [:new, :create]

  def new
    @dj = Dj.new
  end

  def create
    @dj = Dj.find_by(username: params[:username])
    if @dj && @dj.authenticate(params[:password])
      # flash[:messages] = "Welcome back #{@dj.name}"
      session[:dj_id] = @dj.id
      redirect_to @dj
    else
      flash[:errors] = "Incorrect username or password"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:logout] = "Successfully logged out"
    redirect_to login_path
  end

end
