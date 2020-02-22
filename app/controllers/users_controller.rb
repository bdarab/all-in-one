class UsersController < ApplicationController

  before_action :require_user
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome #{@user.username}"
      redirect_to users_path
    else
      flash[:error] = "Something went wrong, try again!"
      render 'new'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Successfully updated your profile"
      redirect_to users_path
    else
      flash[:error] = "Something went wrong, try again!"
      render 'edit'
    end
  end

  def destroy
    @user.destroy
    flash[:error] = "User and all articles created by user have been deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

    def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user and !current_user.admin?
      flash[:danger] = "You can only edit your own profile"
      redirect_to root_path
    end
  end

  def require_admin
    if logged_in? and !current_user.admin?
      flash[:danger] = "Only admins can perform this action"
      redirect_to root_path
    end
  end

end