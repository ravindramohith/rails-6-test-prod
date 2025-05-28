module ApplicationHelper
  def current_user
    @curr ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
  def logged_in?
    !!current_user
  end
end
