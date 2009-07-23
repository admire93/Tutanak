# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	before_filter :authorize, :except => [:new,:login,:index,:create]
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def authorize
		unless User.find_by_id(session[:user_id])
			redirect_to :controller => 'main', :action => 'login'
		end
	end
end
