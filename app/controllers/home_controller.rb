class HomeController < ApplicationController

  def index
    if current_user
      cookies[:user_id] = current_user.id
      #cookies[:user_id] = current_user.id
      # if we use cookies[:user_name] = current_user.name then the name gets url encoded...
      response['set-cookie']="user_name="+current_user.name

    else
      cookies.delete(:user_id)
      cookies.delete(:user_name)
    end
  end

end