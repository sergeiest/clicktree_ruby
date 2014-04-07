class DashboardController < ApplicationController

layout "dashboard"

before_filter do
  	case params[:action]
  	when "charts", "details"
  		if session[:id].nil?
   			redirect_to :action => 'demo' and return
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
	@dailyrequests = Dailyrequest.where("company_id = ?", params[:id]).order("type_id ASC, rdate ASC")
	@hourrequests = Hourrequest.where("company_id = ?", params[:id]).order("type_id ASC, rdate ASC")
	@topips = Topip.where("company_id = ?", params[:id]).sort{|x,y| y.request <=> x.request }
end

def details
	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])

	usersorbots = params[:class_botuser]
	type = (2 if usersorbots == "bot") || 1
	@topips = Topip.where("company_id = ? AND type_id = ?", params[:id], type).sort_by{|e| -e[:request]}[0..9]
	
	@topip_str = ""
	@topip_name_str = ""
	@pages_str = Hash.new
	@pages_name_str = Hash.new
	i = 1

	@hourlyip_str = Hash.new
	@hourlyip_name_str = Hash.new
	@dailyip_str = Hash.new
	@dailyip_name_str = Hash.new

	@topips.each do |ip|
		@topip_str += '[' + i.to_s + ',' + ip.request.to_s + '],'
		@topip_name_str += ('[' + (i + 0.3).to_s + ',"' + ip.title + '"],')
		i += 1
		@pages_str[ip.ipaddress] = ""
		@pages_name_str[ip.ipaddress] = ""
		j = 1
		k = 1 
		ip.pages.all.sort_by{|e| -e[:freq]}.slice(0,10).each do |x|
			@pages_str[ip.ipaddress] += '[' + k.to_s + ',' + x.freq.to_s + '];'
			@pages_name_str[ip.ipaddress] += '[' + (k+0.3).to_s + ',"' + x.url.to_s + '"];'
			k += 1
		end
		@pages_name_str[ip.ipaddress] = @pages_name_str[ip.ipaddress].html_safe

		k = 0
		@hourlyip_str[ip.ipaddress] = ""
		@hourlyip_name_str[ip.ipaddress] = ""
		ip.hourlyips.all.sort_by{|e| e[:hour]}.slice(0,24).each do |x|
			@hourlyip_str[ip.ipaddress] += '[' + k.to_s + ',' + x.count.to_s + '];'
			@hourlyip_name_str[ip.ipaddress] += '[' + (k).to_s + ',"' + k.to_s + '];'
			k += 1
		end
		@hourlyip_name_str[ip.ipaddress] = @hourlyip_name_str[ip.ipaddress].html_safe

		k = 1
		@dailyip_str[ip.ipaddress] = ""
		@dailyip_name_str[ip.ipaddress] = ""
		ip.dailyips.all.sort_by(&:day).each do |x|
			@dailyip_str[ip.ipaddress] += '[' + k.to_s + ',' + x.count.to_s + '];'
			@dailyip_name_str[ip.ipaddress] += '[' + (k).to_s + ',"' + x.day.strftime('%m/%d') + '];'
			k += 1
		end
		@dailyip_name_str[ip.ipaddress] = @dailyip_name_str[ip.ipaddress].html_safe
	end

	@topip_name_str = @topip_name_str.html_safe
	

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
