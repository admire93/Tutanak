class MainController < ApplicationController
  def index
		if session[:user_id]
			@message = 'welcome to the Tutanak  '
			@message += User.find(session[:user_id]).alias.to_s
		else 
			redirect_to :action => 'login'
		end
  end

  def login
		if session[:user_id]
			@notice = 'You already login'
			redirect_to :action => 'index'
		else
			session[:user_id] = nil
		  if request.post?
				user_can_login = User.is_can_login? params[:email], params[:password]
				if user_can_login
					session[:user_id] = User.find_id_by_email(params[:email])
					redirect_to :controller => 'users', :action => 'show'
				else
					flash[:notice] = 'invalid user'
				end
		  end
	  end
  end
  def logout
	  if session[:user_id] 
      session[:user_id] = nil
	  	redirect_to :action => 'index'
		else
			@notice = 'You already login'
			redirect_to :action => 'index'
	  end
  end
end
