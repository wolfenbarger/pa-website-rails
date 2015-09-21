class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  after_action :update_cookies
  
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  private
  	def update_cookies
  		if current_user
  			cookies[:user_id] = current_user.id

        # if we use cookies[:user_name] = current_user.name then the name get url encoded...
        response['set-cookie']="user_name="+current_user.name

        puts cookies[:user_name]

  		else
  			cookies.delete(:user_id)
        cookies.delete(:user_name)
  		end
  	end

end
