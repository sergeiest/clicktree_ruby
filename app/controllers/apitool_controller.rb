require 'json'

class ApitoolController < ApplicationController

layout "dashboard"


def dashboard

	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])

	raw_response = '{"meta": {"limit": 1000, "next": null, "offset": 0, "previous": null, "total_count": 20}, "objects": [{"index": 0, "meta": "2.601 views\n 26 votes", "name": "Best Office Chairs", "resource_uri": ""}, {"index": 1, "meta": "4.898 views\n 2.208 votes", "name": "Top 10 Video Game Developers", "resource_uri": ""}, {"index": 2, "meta": "1.825 views\n 54 votes", "name": "Best Horror Shows for Kids", "resource_uri": ""}, {"index": 3, "meta": "2.333 views\n 122 votes", "name": "Best Pink Floyd Album", "resource_uri": ""}, {"index": 4, "meta": "65.276 views\n 1.316 votes", "name": "Top Video Games", "resource_uri": ""}, {"index": 5, "meta": "5.451 views\n 1.457 votes", "name": "TOP 100 TV Series", "resource_uri": ""}, {"index": 6, "meta": "6.373 views\n 182 votes", "name": "Top 10 3D Printers for consumers", "resource_uri": ""}, {"index": 7, "meta": "2.063 views\n 22 votes", "name": "Watch: Funniest Japanese TV Pranks", "resource_uri": ""}, {"index": 8, "meta": "6.979 views\n 1.063 votes", "name": "Greatest Presidents of the USA", "resource_uri": ""}, {"index": 9, "meta": "9.529 views\n 134 votes", "name": "TOP 100 Clothing Brands", "resource_uri": ""}, {"index": 10, "meta": "14.767 views\n 93 votes", "name": "Books You Have To Read Before You Die", "resource_uri": ""}, {"index": 11, "meta": "10.231 views\n 414 votes", "name": "Awesome fantasy fiction books and series", "resource_uri": ""}, {"index": 12, "meta": "3.734 views\n 280 votes", "name": "Actors Who Should Have Won Oscars But Have Not", "resource_uri": ""}, {"index": 13, "meta": "16.430 views\n 142 votes", "name": "Best Beatles Album", "resource_uri": ""}, {"index": 14, "meta": "3.627 views\n 155 votes", "name": "Best Character in Arrested Development TV-series", "resource_uri": ""}, {"index": 15, "meta": "3.333 views\n 77 votes", "name": "Best Series on Netflix", "resource_uri": ""}, {"index": 16, "meta": "4.653 views\n 68 votes", "name": "Best 90s Toy", "resource_uri": ""}, {"index": 17, "meta": "11.571 views\n 767 votes", "name": "Top 100 Animated Movies", "resource_uri": ""}, {"index": 18, "meta": "10.922 views\n 73 votes", "name": "Best Internet Video Series of All Time", "resource_uri": ""}, {"index": 19, "meta": "43.949 views\n 7.461 votes", "name": "Best Birds of Angry Birds", "resource_uri": ""}]}'
	
	@response1 = JSON.pretty_generate(JSON.parse(raw_response))
	@response2 = @response1
end

def new

	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])
	
end 

end
