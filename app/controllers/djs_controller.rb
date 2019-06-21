class DjsController < ApplicationController
  skip_before_action :authorized?, only: [:new, :create]

  def new
    @dj = Dj.new
  end

  def create
    @dj = Dj.create(username: params[:username], password: params[:password])
    if @dj.valid?
      session[:dj_id] = @dj.id
      redirect_to @dj
    else
      flash[:errors] = @dj.errors.full_messages
      redirect_to new_dj_path
    end
  end

  def edit
    @dj = Dj.find(params[:id])
  end

  def update
    @dj = Dj.find(params[:id])
    @dj.update(dj_params(:username, :name, :bio))
    if @dj.valid?
      redirect_to @dj
    else
      flash[:errors] = @dj.errors.full_messages
      redirect_to edit_dj_path
    end
  end

  def show
    @dj = Dj.find(params[:id])
  end

  def destroy
    @dj = Dj.find(params[:id])
    @dj.destroy
    logout
    redirect_to logout_path
  end

  private

  def dj_params(*args)
    params.require(:dj).permit(*args)
  end
end
