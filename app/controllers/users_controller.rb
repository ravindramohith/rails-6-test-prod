class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
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

  def edit
  end

  def update
    # byebug
    if @user.update(user_params)
      redirect_to edit_user_path(@user)
    else
      redirect_to edit_user_path(@user)
    end
  end

  def show
    email_address = @user.email.downcase
    
    # Create the SHA256 hash
    hash = Digest::SHA256.hexdigest(email_address)
    
    # Set default URL and size parameters
    default = "https://www.example.com/default.jpg"
    size = 40
    
    # Compile the full URL with URI encoding for the parameters
    params = URI.encode_www_form('s' => size)
    @image_src = "https://www.gravatar.com/avatar/#{hash}?#{params}"
  end

  def index
    @users = User.all
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end