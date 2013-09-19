class MicropostsController < ApplicationController
  before_filter  :signed_in_user, only: [:create, :destroy]
  def create
    @micropost =current_user.microposts.build(params[:content])
    if @micropost.save
      flash[:success] = "Micropost created"
      redirect_to root_path
    else
      render 'static_pages/home'
    end
  end
  def destroy
  end
  def index
  end
end