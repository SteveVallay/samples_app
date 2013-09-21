class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index,:edit,:update, :destroy]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :admin_user, only: :destroy
  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end
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
    @microposts = @user.microposts.paginate(page: params[:page],per_page: 3)
  end

  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])  
    if @user.update_attributes(params.require(:user).permit(:name,:email,:password,:password_confirmation))
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
      #comment
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destoryed"
    redirect_to users_path
  end
  def home
    if signed_in?
      @micropost = current_user.microposts.build
      if @micropost
        @feed_items = current_user.feed.padginate(page: params[:page], per_page: 3)
      else
        @feed_items = []
      end
    end
  end

  private 
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
