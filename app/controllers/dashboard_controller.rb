class DashboardController < ApplicationController

layout "dashboard"

before_filter do
  	case params[:action]
  	when "charts", "details"
  		if session[:id].nil?
   			redirect_to :action => 'login' and return
   		else
			params[:id] = session[:id] if session[:id] != 1 		
   		end
  	end
end

def charts
	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])
	# @visitnumbers = Visitnumber.where("company_id = ?", params[:id])
	@requesttypes = Requesttype.where("company_id = ?", params[:id]).sort{|x,y| x.type_id <=> y.type_id }
	@iptypes = Iptype.where("company_id = ?", params[:id]).sort{|x,y| x.type_id <=> y.type_id }
	@dailyrequests = Dailyrequest.where("company_id = ?", params[:id]).sort{|x,y| x.type_id <=> y.type_id }
	@hourrequests = Hourrequest.where("company_id = ?", params[:id]).sort{|x,y| x.type_id <=> y.type_id }
	@topips = Topip.where("company_id = ?", params[:id]).sort{|x,y| y.request <=> x.request }
end

def details
	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])

	puts params[:id]

	usersorbots = params[:class_botuser]
	type = (2 if usersorbots == "bot") || 1
	@topips = Topip.where("company_id = ? AND type_id = ?", params[:id], type).sort_by{|e| -e[:request]}
	
	@topip_str = ""
	@pages_str = Hash.new
	i = 1
	@topips.each do |ip|
		@topip_str += '[' + i.to_s + ',' + ip.request.to_s + '],'
		i += 1

		@pages_str[ip.ipaddress] = ""

		j = 1
		ip.pages.all.sort_by{|e| -e[:freq]}.slice(0,5).each do |x|
			@pages_str[ip.ipaddress] += '[' + i.to_s + ',' + x.freq.to_s + '],'
		end
	end




	@requesttypes = Requesttype.where("company_id = ?", params[:id]).sort{|x,y| x.type_id <=> y.type_id }
	@iptypes = Iptype.where("company_id = ?", params[:id]).sort{|x,y| x.type_id <=> y.type_id }
	@dailyrequests = Dailyrequest.where("company_id = ?", params[:id]).sort{|x,y| x.type_id <=> y.type_id }
	@hourrequests = Hourrequest.where("company_id = ?", params[:id]).sort{|x,y| x.type_id <=> y.type_id }
	#@topips = Topip.where("company_id = ?", params[:id]).sort{|x,y| y.request <=> x.request }
end

def demo
	params[:id] = User.first.authentication_id
	@user = User.find_by_authentication_id(params[:id])
	# @visitnumbers = Visitnumber.where("company_id = ?", params[:id])
	@requesttypes = Requesttype.where("company_id = ?", params[:id])
	@iptypes = Iptype.where("company_id = ?", params[:id])
	@dailyrequests = Dailyrequest.where("company_id = ?", params[:id])
	@hourrequests = Hourrequest.where("company_id = ?", params[:id])
	@topips = Topip.where("company_id = ?", params[:id]).sort{|x,y| y.request <=> x.request }	

	respond_to do |format|
		format.html {render "charts"}
	end
end

def login
	@email = ""
end	

def logout
	reset_session
	redirect_to :action => 'login'
end	

def check_login
	user = Authentication.where("email = ? AND password = ?", params[:email], params[:password])

	if user.length > 0
		session[:id] = user.first.id
		redirect_to :action => 'charts' and return
	else
		@email = params[:email]
		respond_to do |format|
			format.html {render "login"}
		end
	end   	
  	
end

end
