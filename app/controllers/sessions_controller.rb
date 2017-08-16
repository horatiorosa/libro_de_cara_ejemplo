class SessionsController < ApplicationController
  def create
    user = User.from_omni_auth(env["omniaith.auth"])
    sessio[:user_id] = user.user_id
    redirect_to_root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to_root_url
  end
end
