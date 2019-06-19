class DjsController < ApplicationController

  def new
    @dj = Dj.new
  end

  def create
    @dj = Dj.create(dj_params(:username, :password))
    if @dj.valid?
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

  def delete
    @dj = Dj.find(params[:id])
    @dj.destroy
    redirect_to login_path
  end

  private

  def dj_params(*args)
    params.require(:dj).permit(*args)
  end
end
