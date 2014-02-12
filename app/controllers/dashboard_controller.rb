class DashboardController < ApplicationController

layout "dashboard"

def charts
	params[:id] = 1
end

end
