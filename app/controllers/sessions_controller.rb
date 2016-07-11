class SessionsController < ApplicationController
  def create
    begin
    #   render text: request.env['omniauth.auth'].to_yaml

      @user = User.from_omniauth(request.env['omniauth.auth'])
      session[:user_uid] = @user.uid
      flash[:success] = "Welcome, #{@user.Name}!"
    rescue Exception => e
      flash[:error] = e.message
      flash[:warning] = 'There was an error while trying to authenticate you...'
    end
    redirect_to root_path
  end

  def destroy
    if current_user
      session.delete(:user_uid)
      flash[:success] = 'See you!'
    end
    redirect_to root_path
  end

end
