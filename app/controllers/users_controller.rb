class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(params.require(:user).permit(:name,:email,:password,:password_confirmation))
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      flash[:error] = "Fail to create new user !"
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
  end
end
