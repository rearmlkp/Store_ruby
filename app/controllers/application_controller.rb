require_relative 'user_search'

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    # session.delete(:user_uid)
    if @current_user.nil?
      if session[:user_uid]
        @current_user = UserSearch.get_user session[:user_uid]
      end
    else
      @current_user
    end
  end

  helper_method :current_user
end
