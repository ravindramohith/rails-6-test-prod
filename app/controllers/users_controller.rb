class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    # byebug
    if params[:password] != params[:password_confirmation]
      redirect_to '/signup'
    end
    @user = User.create(user_params)
    if @user.save
      redirect_to articles_path
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end