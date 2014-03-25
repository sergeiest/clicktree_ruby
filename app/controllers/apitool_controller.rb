class ApitoolController < ApplicationController

layout "dashboard"


def dashboard
	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])

	# Temp, before the final implementation!
	respond_to do |format|
		format.html {render "new"}
	end
end

def new

	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])
	
end 

end
