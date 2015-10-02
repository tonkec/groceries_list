class UsersController < ApplicationController
  before_action :logged_in_user , only: [:show]
  before_action :correct_user, only: [:show]
  def new
    @user = User.new
    if logged_in? 
      redirect_to root_url
    end
  end

  def show
    redirect_to root_url
  end

  def create 
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
      flash.now[:success] = 'Welcome!'
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless @user == current_user
  end
end
