class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_access_control_headers

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

 def current_or_guest_user
    if current_user
      if session[:guest_user_id] && session[:guest_user_id] != current_user.id
        logging_in
        guest_user(false).try :destroy
        session[:guest_user_id] = nil
      end
      current_user
    else
      guest_user
    end
  end

  def guest_user with_retry = true
    session[:guest_user_id] ||= create_guest_user.id
    @cached_guest_user ||= User.find session[:guest_user_id]
  rescue ActiveRecord::RecordNotFound
     session[:guest_user_id] = nil
     guest_user if with_retry
  end

  private

  # Transfer stuff from guest to user inside this method
  def logging_in
  end

  def create_guest_user
    user = User.create!(guest: true)
    session[:guest_user_id] = user.id
    user
  end

end
