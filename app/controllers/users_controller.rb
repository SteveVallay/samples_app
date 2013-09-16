class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit,:update]
  def new
  end
  def create
    @user = User.new(params.require(:user).permit(:name,:email,:password,:password_confirmation))
    if @user.save
      sign_in(@user)
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

  def signed_in_user
    redirect_to signin_path , notice: "Please sign in." unless signed_in?
  end
end
