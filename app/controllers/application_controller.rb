class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  before_filter :require_user

	protected 

	def require_user
  		return true unless current_user
	end

	def current_user
	  @current_user ||= User.find(session[:user_id]) if session[:user_id]
	  rescue ActiveRecord::RecordNotFound 
	end
	
	def authenticate_user
	  if session[:user_id]
	     # set current user object to @current_user object variable
	    @current_user = User.find session[:user_id] 
	    return true	
	  else
	    redirect_to(:controller => 'sessions', :action => 'login')
	    return false
	  end
	end
	
	def save_login_state
	  if session[:user_id]
	    redirect_to(:controller => 'sessions', :action => 'home')
	    return false
	  else
	    return true
	  end
	end
end
