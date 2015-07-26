class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @user = User.new
    @users = User.all
  end

  def add
    @user = User.new(user_params)
    @users = User.all
    if @user.save
      flash[:success] = "New User was added successfully."
      redirect_to users_path
    else
      render 'index'
    end
  end

  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_path
  end

  def show
    @user = User.find(params[:id])
    unless @user == current_user || current_user.admin?
      redirect_to :back, :alert => "Access denied."
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
