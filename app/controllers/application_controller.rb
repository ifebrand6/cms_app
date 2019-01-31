class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

    private
  def confirmed_logged_in
  	unless session[:user_id]
  		flash[:notice] = "Please log in."
  		redirect_to(:controller => 'access',:action => 'login')
  		return false
  		else
  			return true
  	end
  	
  end
end
