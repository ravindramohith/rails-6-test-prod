class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  
  def hello
    render html: 'hello'
  end

  def current_user
    @curr ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end

  private

  def require_user
    unless logged_in?
      flash[:alert] = "You must be logged in to perform that action."
      redirect_to login_path
    end
  end
end
