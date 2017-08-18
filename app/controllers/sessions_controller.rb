class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    puts user.first_name
    session[:user_id] = user.id
    redirect_to welcome_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to welcome_path
  end
end
