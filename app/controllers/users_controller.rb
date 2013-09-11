class UsersController < ApplicationController
  def new
  end
  def create
    @user = User.new(params.require(:user).permit(:name,:email,:password,:password_confirmation))
    if @user.save
      puts 'success'
      redirect_to @user
    else
      puts 'fail'
      render 'new'
    end
  end
  def show
    @user = User.find(params[:id])
  end
end
