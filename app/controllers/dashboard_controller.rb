class DashboardController < ApplicationController

layout "dashboard"

before_filter do
  	if session[:id].nil? and params[:action] == "charts"
   		redirect_to :action => 'login' and return
  	end
end

def charts

end

def login
	@email = ""
end	

def logout
	reset_session
	redirect_to :action => 'login'
end	

def check_login
	if (params[:email] == "cghersi@snip2code.com" and params[:password] == "beta1") || (params[:email] == "team@clicktreelabs.com" and params[:password] == "it is me")
		session[:id] = 1
		redirect_to :action => 'charts' and return
	end

	respond_to do |format|
		@email = params[:email]
     	format.html {render "login"}
    end
  	
end

end
