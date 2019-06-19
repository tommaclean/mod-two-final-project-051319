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

  def show
    @dj = Dj.find(params[:id])
  end

  private

  def dj_params(*args)
    params.require(:dj).permit(*args)
  end
end
