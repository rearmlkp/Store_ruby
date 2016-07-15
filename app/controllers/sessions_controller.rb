require_relative 'user_search'

class SessionsController < ApplicationController
  def create
    auth = request.env['omniauth.auth'].reject! { |k| k == 'credentials' || k == 'extra' }
    UserSearch.create_user auth
    session[:user_uid] = auth['provider']+auth['uid']
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_uid)
      flash.delete(:success)
    end
    redirect_to root_path
  end

end
