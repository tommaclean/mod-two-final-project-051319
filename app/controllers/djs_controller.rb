class DjsController < ApplicationController
  skip_before_action :authorized?, only: [:new, :create]
  before_action :find_page_dj, only: [:show, :edit, :update, :destroy]

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
    if @dj.id != @current_dj.id
      redirect_to @dj
    end
  end

  def update
    @dj.update(username: params[:username], name: params[:name], bio: params[:bio])
    if @dj.valid?
      redirect_to @dj
    else
      flash[:errors] = @dj.errors.full_messages
      redirect_to edit_dj_path
    end
  end

  def show
  end

  def destroy
    @dj.destroy
    logout
    redirect_to logout_path
  end

  private

  def dj_params(*args)
    params.require(:dj).permit(*args)
  end

  def find_page_dj
    @dj = Dj.find(params[:id])
  end

end
