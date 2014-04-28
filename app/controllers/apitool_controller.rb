require 'json'

class ApitoolController < ApplicationController

layout "dashboard"

#before_filter do
#  	case params[:action]
#  	when "dashboard"
#  		if session[:id].nil?
#   			redirect_to :action => 'signup' and return
#   		else
#			params[:id] = session[:id]		
#  		end
#   	end
#end

def dashboard

	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])

	if not @user.nil?
		@username = @user.name
		@company = @user.company
	else
		@username = "Demo"
		@company = "Clicktree"
	end

	domain = params[:api_domain]
	if domain == "picturegram"
		@api_domain = "Picturegram"

		@api_title1 = "Front Page"
		@api_maindesc1 = "This API call returns pictures which are currently on the front page."
		@raw_request1 = 'curl http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/virtualapi/picturegram/?username=api_test\&api_key=3cec1a36f3cb9c7a24216afe71a7aa8c720255fb\&method=frontpage'
		raw_response = '{"meta": {"limit": 1000, "next": null, "offset": 0, "previous": null, "total_count": 40}, "objects": [{"index": 0, "thumbnail_href": "/picture/695989882920892158_50599348/"}, {"index": 1, "thumbnail_href": "/picture/695964974116033434_179149915/"}, {"index": 2, "thumbnail_href": "/picture/695977429678748736_403498132/"}, {"index": 3, "thumbnail_href": "/picture/695993756213785472_7930203/"}, {"index": 4, "thumbnail_href": "/picture/695983326619607782_31624199/"}, {"index": 5, "thumbnail_href": "/picture/696006278083124060_23776413/"}, {"index": 6, "thumbnail_href": "/picture/695998807090494678_18483678/"}, {"index": 7, "thumbnail_href": "/picture/695998437887702553_185175380/"}, {"index": 8, "thumbnail_href": "/picture/696006091523367043_207789231/"}, {"index": 9, "thumbnail_href": "/picture/696027666809693694_29810584/"}, {"index": 10, "thumbnail_href": "/picture/695970965669018824_47543070/"}, {"index": 11, "thumbnail_href": "/picture/696007751922471837_13514211/"}, {"index": 12, "thumbnail_href": "/picture/696012216974527626_453366618/"}, {"index": 13, "thumbnail_href": "/picture/695998741751055102_1241458119/"}, {"index": 14, "thumbnail_href": "/picture/696025760104333970_25435655/"}, {"index": 15, "thumbnail_href": "/picture/696006627359974363_144646783/"}, {"index": 16, "thumbnail_href": "/picture/696032044517635611_689484300/"}, {"index": 17, "thumbnail_href": "/picture/695981822177767557_185480571/"}, {"index": 18, "thumbnail_href": "/picture/696013274787432577_32527641/"}, {"index": 19, "thumbnail_href": "/picture/696031340508489644_19870776/"}, {"index": 20, "thumbnail_href": "/picture/695989882920892158_50599348/"}, {"index": 21, "thumbnail_href": "/picture/695964974116033434_179149915/"}, {"index": 22, "thumbnail_href": "/picture/695977429678748736_403498132/"}, {"index": 23, "thumbnail_href": "/picture/695993756213785472_7930203/"}, {"index": 24, "thumbnail_href": "/picture/695983326619607782_31624199/"}, {"index": 25, "thumbnail_href": "/picture/696006278083124060_23776413/"}, {"index": 26, "thumbnail_href": "/picture/695998807090494678_18483678/"}, {"index": 27, "thumbnail_href": "/picture/695998437887702553_185175380/"}, {"index": 28, "thumbnail_href": "/picture/696006091523367043_207789231/"}, {"index": 29, "thumbnail_href": "/picture/696027666809693694_29810584/"}, {"index": 30, "thumbnail_href": "/picture/695970965669018824_47543070/"}, {"index": 31, "thumbnail_href": "/picture/696007751922471837_13514211/"}, {"index": 32, "thumbnail_href": "/picture/696012216974527626_453366618/"}, {"index": 33, "thumbnail_href": "/picture/695998741751055102_1241458119/"}, {"index": 34, "thumbnail_href": "/picture/696025760104333970_25435655/"}, {"index": 35, "thumbnail_href": "/picture/696006627359974363_144646783/"}, {"index": 36, "thumbnail_href": "/picture/696032044517635611_689484300/"}, {"index": 37, "thumbnail_href": "/picture/695981822177767557_185480571/"}, {"index": 38, "thumbnail_href": "/picture/696013274787432577_32527641/"}, {"index": 39, "thumbnail_href": "/picture/696031340508489644_19870776/"}]}'
		@response1 = JSON.pretty_generate(JSON.parse(raw_response))
		@desc1 = {:thumbnail_href => "Path of where the picture can be found on the website."}

		@api_title2 = "Specific Picture"
		@api_maindesc2 = "This API call returns information on a specific picture given it's path."
		@raw_request2 = 'curl http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/virtualapi/picturegram/?username=api_test\&api_key=3cec1a36f3cb9c7a24216afe71a7aa8c720255fb\&method=picture\&path=695948427283543832_2003724'
		raw_response2 = '{"meta": {"limit": 1000, "next": null, "offset": 0, "previous": null, "total_count": 1}, "objects": [{"authorlink": "! purposeofenvy Cincinnati @purposeofenvy", "comments": "182 Comments", "fillWidth_src": "http://distilleryimage8.s3.amazonaws.com/80252edcc12111e3b5450002c9c70a44_8.jpg", "index": 0, "likes": "15889 Likes"}]}'
		@response2 = JSON.pretty_generate(JSON.parse(raw_response2))
		@desc2 = {:authorlink => "Username of author who posted the picture", :comments => "The amount of comments the picture has.", :likes => "The amount of likes the picture has.", :fillWidth_src => "The source of the picture so that it can be saved."}

		@api_title3 = "Search"
		@api_maindesc = "This API call returns pictures found given a search query."
		@raw_request3 = 'curl http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/virtualapi/picturegram/?username=api_test\&api_key=3cec1a36f3cb9c7a24216afe71a7aa8c720255fb\&method=search\&path=music'
		raw_response3 = '{"meta": {"limit": 1000, "next": null, "offset": 0, "previous": null, "total_count": 40}, "objects": [{"index": 0, "thumbnail_href": "/picture/696039834523582284_24664910/"}, {"index": 1, "thumbnail_href": "/picture/696044604202176597_32594883/"}, {"index": 2, "thumbnail_href": "/picture/695311969467005218_275992589/"}, {"index": 3, "thumbnail_href": "/picture/696044602432292041_263869992/"}, {"index": 4, "thumbnail_href": "/picture/696042971617792563_31873043/"}, {"index": 5, "thumbnail_href": "/picture/696044598142306442_51436665/"}, {"index": 6, "thumbnail_href": "/picture/696044579924036665_1252853410/"}, {"index": 7, "thumbnail_href": "/picture/696044578256254023_194634924/"}, {"index": 8, "thumbnail_href": "/picture/696043190694411997_496307782/"}, {"index": 9, "thumbnail_href": "/picture/696043271276887500_11189254/"}, {"index": 10, "thumbnail_href": "/picture/696044548733307591_1158451569/"}, {"index": 11, "thumbnail_href": "/picture/692508637012214856_1244085048/"}, {"index": 12, "thumbnail_href": "/picture/695795110524596419_4234459/"}, {"index": 13, "thumbnail_href": "/picture/696044531680575712_401377847/"}, {"index": 14, "thumbnail_href": "/picture/632837011111993341_494750822/"}, {"index": 15, "thumbnail_href": "/picture/696044526599055726_182169777/"}, {"index": 16, "thumbnail_href": "/picture/695778840590180750_314866815/"}, {"index": 17, "thumbnail_href": "/picture/696041125723018299_22234644/"}, {"index": 18, "thumbnail_href": "/picture/694920807350365715_274652394/"}, {"index": 19, "thumbnail_href": "/picture/696041749101425989_30735524/"}, {"index": 20, "thumbnail_href": "/picture/696039834523582284_24664910/"}, {"index": 21, "thumbnail_href": "/picture/696044604202176597_32594883/"}, {"index": 22, "thumbnail_href": "/picture/695311969467005218_275992589/"}, {"index": 23, "thumbnail_href": "/picture/696044602432292041_263869992/"}, {"index": 24, "thumbnail_href": "/picture/696042971617792563_31873043/"}, {"index": 25, "thumbnail_href": "/picture/696044598142306442_51436665/"}, {"index": 26, "thumbnail_href": "/picture/696044579924036665_1252853410/"}, {"index": 27, "thumbnail_href": "/picture/696044578256254023_194634924/"}, {"index": 28, "thumbnail_href": "/picture/696043190694411997_496307782/"}, {"index": 29, "thumbnail_href": "/picture/696043271276887500_11189254/"}, {"index": 30, "thumbnail_href": "/picture/696044548733307591_1158451569/"}, {"index": 31, "thumbnail_href": "/picture/692508637012214856_1244085048/"}, {"index": 32, "thumbnail_href": "/picture/695795110524596419_4234459/"}, {"index": 33, "thumbnail_href": "/picture/696044531680575712_401377847/"}, {"index": 34, "thumbnail_href": "/picture/632837011111993341_494750822/"}, {"index": 35, "thumbnail_href": "/picture/696044526599055726_182169777/"}, {"index": 36, "thumbnail_href": "/picture/695778840590180750_314866815/"}, {"index": 37, "thumbnail_href": "/picture/696041125723018299_22234644/"}, {"index": 38, "thumbnail_href": "/picture/694920807350365715_274652394/"}, {"index": 39, "thumbnail_href": "/picture/696041749101425989_30735524/"}]}'
		@response3 = JSON.pretty_generate(JSON.parse(raw_response3))
		@desc3 = {:thumbnail_href => "Path of where the picture can be found on the website."}
	

	else
		@api_domain = "Listnerd"

		@api_title1 = "Front Page"
		@api_maindesc1 = "This API call returns lists which are currently on the front page."
		@raw_request1 = 'curl http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/virtualapi/listnerd/?username=api_test\&api_key=3cec1a36f3cb9c7a24216afe71a7aa8c720255fb\&method=frontpage'
		raw_response = '{"meta": {"limit": 1000, "next": null, "offset": 0, "previous": null, "total_count": 20}, "objects": [{"index": 0, "meta": "2.601 views\n 26 votes", "name": "Best Office Chairs", "resource_uri": ""}, {"index": 1, "meta": "4.898 views\n 2.208 votes", "name": "Top 10 Video Game Developers", "resource_uri": ""}, {"index": 2, "meta": "1.825 views\n 54 votes", "name": "Best Horror Shows for Kids", "resource_uri": ""}, {"index": 3, "meta": "2.333 views\n 122 votes", "name": "Best Pink Floyd Album", "resource_uri": ""}, {"index": 4, "meta": "65.276 views\n 1.316 votes", "name": "Top Video Games", "resource_uri": ""}, {"index": 5, "meta": "5.451 views\n 1.457 votes", "name": "TOP 100 TV Series", "resource_uri": ""}, {"index": 6, "meta": "6.373 views\n 182 votes", "name": "Top 10 3D Printers for consumers", "resource_uri": ""}, {"index": 7, "meta": "2.063 views\n 22 votes", "name": "Watch: Funniest Japanese TV Pranks", "resource_uri": ""}, {"index": 8, "meta": "6.979 views\n 1.063 votes", "name": "Greatest Presidents of the USA", "resource_uri": ""}, {"index": 9, "meta": "9.529 views\n 134 votes", "name": "TOP 100 Clothing Brands", "resource_uri": ""}, {"index": 10, "meta": "14.767 views\n 93 votes", "name": "Books You Have To Read Before You Die", "resource_uri": ""}, {"index": 11, "meta": "10.231 views\n 414 votes", "name": "Awesome fantasy fiction books and series", "resource_uri": ""}, {"index": 12, "meta": "3.734 views\n 280 votes", "name": "Actors Who Should Have Won Oscars But Have Not", "resource_uri": ""}, {"index": 13, "meta": "16.430 views\n 142 votes", "name": "Best Beatles Album", "resource_uri": ""}, {"index": 14, "meta": "3.627 views\n 155 votes", "name": "Best Character in Arrested Development TV-series", "resource_uri": ""}, {"index": 15, "meta": "3.333 views\n 77 votes", "name": "Best Series on Netflix", "resource_uri": ""}, {"index": 16, "meta": "4.653 views\n 68 votes", "name": "Best 90s Toy", "resource_uri": ""}, {"index": 17, "meta": "11.571 views\n 767 votes", "name": "Top 100 Animated Movies", "resource_uri": ""}, {"index": 18, "meta": "10.922 views\n 73 votes", "name": "Best Internet Video Series of All Time", "resource_uri": ""}, {"index": 19, "meta": "43.949 views\n 7.461 votes", "name": "Best Birds of Angry Birds", "resource_uri": ""}]}'
		@response1 = JSON.pretty_generate(JSON.parse(raw_response))
		@desc1 = {:name => "The name of the list.", :meta => "Displays the number of votes and views for the list."}

		@api_title2 = "Specific List"
		@api_maindesc2 = "This API call returns information on a specific list given it's path."
		@raw_request2 = 'curl http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/virtualapi/listnerd/?username=api_test\&api_key=3cec1a36f3cb9c7a24216afe71a7aa8c720255fb\&method=list\&path=top-10-songs-by-savant'
		raw_response2 = '{"meta": {"limit": 1000, "next": null, "offset": 0, "previous": null, "total_count": 88}, "objects": [{"index": 0, "position": "1", "title": "Bananonymous", "vote": "Rate\n\n\n7.92\n\n\n\n\n\n36 votes"}, {"index": 1, "position": "2", "title": "SPLINTER", "vote": "Rate\n\n\n9.31\n\n\n\n\n\n26 votes"}, {"index": 2, "position": "3", "title": "Melody Circus", "vote": "Rate\n\n\n8.50\n\n\n\n\n\n24 votes"}, {"index": 3, "position": "4", "title": "FUCK NEXUS", "vote": "Rate\n\n\n8.76\n\n\n\n\n\n21 votes"}, {"index": 4, "position": "5", "title": "LIVING IPOD", "vote": "Rate\n\n\n8.15\n\n\n\n\n\n20 votes"}, {"index": 5, "position": "6", "title": "STARFISH", "vote": "Rate\n\n\n8.63\n\n\n\n\n\n19 votes"}, {"index": 6, "position": "7", "title": "Sledgehammer", "vote": "Rate\n\n\n9.06\n\n\n\n\n\n17 votes"}, {"index": 7, "position": "8", "title": "Ghetto Blastah", "vote": "Rate\n\n\n8.39\n\n\n\n\n\n18 votes"}, {"index": 8, "position": "9", "title": "ISM", "vote": "Rate\n\n\n9.13\n\n\n\n\n\n16 votes"}, {"index": 9, "position": "10", "title": "Pirate bay", "vote": "Rate\n\n\n8.44\n\n\n\n\n\n16 votes"}, {"index": 10, "position": "11", "title": "Black Magic", "vote": "Rate\n\n\n8.31\n\n\n\n\n\n16 votes"}, {"index": 11, "position": "12", "title": "The Horror", "vote": "Rate\n\n\n8.93\n\n\n\n\n\n15 votes"}, {"index": 12, "position": "13", "title": "Nightmare Adventures", "vote": "Rate\n\n\n7.94\n\n\n\n\n\n16 votes"}, {"index": 13, "position": "14", "title": "BREAKDOWN", "vote": "Rate\n\n\n9.21\n\n\n\n\n\n14 votes"}, {"index": 14, "position": "15", "title": "Sayonara", "vote": "Rate\n\n\n9.21\n\n\n\n\n\n14 votes"}, {"index": 15, "position": "16", "title": "Alchemist (feat. Gyno Sydal)", "vote": "Rate\n\n\n8.93\n\n\n\n\n\n14 votes"}, {"index": 16, "position": "17", "title": "CHAMPAGNE", "vote": "Rate\n\n\n8.93\n\n\n\n\n\n14 votes"}, {"index": 17, "position": "18", "title": "The Beginning Is Near", "vote": "Rate\n\n\n8.86\n\n\n\n\n\n14 votes"}, {"index": 18, "position": "19", "title": "NINUR", "vote": "Rate\n\n\n7.93\n\n\n\n\n\n15 votes"}, {"index": 19, "position": "20", "title": "OVERWORLD", "vote": "Rate\n\n\n9.31\n\n\n\n\n\n13 votes"}, {"index": 20, "position": "21", "title": "STARSCREAM FOREVER", "vote": "Rate\n\n\n9.42\n\n\n\n\n\n12 votes"}, {"index": 21, "position": "22", "title": "BURGERTIME (SAVANT THEME)", "vote": "Rate\n\n\n9.17\n\n\n\n\n\n12 votes"}, {"index": 22, "position": "23", "title": "FIRECLOUD", "vote": "Rate\n\n\n8.92\n\n\n\n\n\n12 votes"}, {"index": 23, "position": "24", "title": "Sustainer", "vote": "Rate\n\n\n8.92\n\n\n\n\n\n12 votes"}, {"index": 24, "position": "25", "title": "TRUST ISSUES", "vote": "Rate\n\n\n8.83\n\n\n\n\n\n12 votes"}, {"index": 25, "position": "26", "title": "DIRTY MARY", "vote": "Rate\n\n\n9.64\n\n\n\n\n\n11 votes"}, {"index": 26, "position": "27", "title": "YOU CAN PLAY", "vote": "Rate\n\n\n9.36\n\n\n\n\n\n11 votes"}, {"index": 27, "position": "28", "title": "FLASHBACH", "vote": "Rate\n\n\n8.42\n\n\n\n\n\n12 votes"}, {"index": 28, "position": "29", "title": "The Beat", "vote": "Rate\n\n\n9.09\n\n\n\n\n\n11 votes"}, {"index": 29, "position": "30", "title": "Face Off", "vote": "Rate\n\n\n8.64\n\n\n\n\n\n11 votes"}, {"index": 30, "position": "31", "title": "Dancer in the Dark", "vote": "Rate\n\n\n8.45\n\n\n\n\n\n11 votes"}, {"index": 31, "position": "32", "title": "BAD BAWS", "vote": "Rate\n\n\n9.20\n\n\n\n\n\n10 votes"}, {"index": 32, "position": "33", "title": "Prelude", "vote": "Rate\n\n\n9.10\n\n\n\n\n\n10 votes"}, {"index": 33, "position": "34", "title": "HERO FROM THE PAST", "vote": "Rate\n\n\n9.33\n\n\n\n\n\n9 votes"}, {"index": 34, "position": "35", "title": "HOLY GHOST", "vote": "Rate\n\n\n9.33\n\n\n\n\n\n9 votes"}, {"index": 35, "position": "36", "title": "Wildstyle", "vote": "Rate\n\n\n9.22\n\n\n\n\n\n9 votes"}, {"index": 36, "position": "37", "title": "VINTER", "vote": "Rate\n\n\n9.11\n\n\n\n\n\n9 votes"}, {"index": 37, "position": "38", "title": "8-BIT LIGHTSABER", "vote": "Rate\n\n\n9.00\n\n\n\n\n\n9 votes"}, {"index": 38, "position": "39", "title": "Redemption", "vote": "Rate\n\n\n9.00\n\n\n\n\n\n9 votes"}, {"index": 39, "position": "40", "title": "Mother Earth", "vote": "Rate\n\n\n8.10\n\n\n\n\n\n10 votes"}, {"index": 40, "position": "41", "title": "Paradisco", "vote": "Rate\n\n\n8.78\n\n\n\n\n\n9 votes"}, {"index": 41, "position": "42", "title": "Fat Cat Shuffle", "vote": "Rate\n\n\n8.67\n\n\n\n\n\n9 votes"}, {"index": 42, "position": "43", "title": "MYSTERY", "vote": "Rate\n\n\n8.67\n\n\n\n\n\n9 votes"}, {"index": 43, "position": "44", "title": "MEGABOY", "vote": "Rate\n\n\n9.63\n\n\n\n\n\n8 votes"}, {"index": 44, "position": "45", "title": "THUNDERCLOUT", "vote": "Rate\n\n\n9.50\n\n\n\n\n\n8 votes"}, {"index": 45, "position": "46", "title": "VARIO", "vote": "Rate\n\n\n9.13\n\n\n\n\n\n8 votes"}, {"index": 46, "position": "47", "title": "THE THIRD EYE", "vote": "Rate\n\n\n9.00\n\n\n\n\n\n8 votes"}, {"index": 47, "position": "48", "title": "ARCADE NIGHT CRUISE", "vote": "Rate\n\n\n8.88\n\n\n\n\n\n8 votes"}, {"index": 48, "position": "49", "title": "NO SHIT SHERLOCK", "vote": "Rate\n\n\n8.88\n\n\n\n\n\n8 votes"}, {"index": 49, "position": "50", "title": "SHADOW", "vote": "Rate\n\n\n8.88\n\n\n\n\n\n8 votes"}, {"index": 50, "position": "51", "title": "STORMTROOPER", "vote": "Rate\n\n\n8.88\n\n\n\n\n\n8 votes"}, {"index": 51, "position": "52", "title": "Wildstyle", "vote": "Rate\n\n\n9.86\n\n\n\n\n\n7 votes"}, {"index": 52, "position": "53", "title": "DESTROY THE DRAGON", "vote": "Rate\n\n\n8.75\n\n\n\n\n\n8 votes"}, {"index": 53, "position": "54", "title": "BA-DA BING!", "vote": "Rate\n\n\n9.43\n\n\n\n\n\n7 votes"}, {"index": 54, "position": "55", "title": "No Time For Pussy", "vote": "Rate\n\n\n8.38\n\n\n\n\n\n8 votes"}, {"index": 55, "position": "56", "title": "DIAMOND BLUSH", "vote": "Rate\n\n\n9.29\n\n\n\n\n\n7 votes"}, {"index": 56, "position": "57", "title": "OUTFOX", "vote": "Rate\n\n\n8.25\n\n\n\n\n\n8 votes"}, {"index": 57, "position": "58", "title": "ANTIPIXEL", "vote": "Rate\n\n\n8.13\n\n\n\n\n\n8 votes"}, {"index": 58, "position": "59", "title": "RIDE LIKE THE WIND", "vote": "Rate\n\n\n8.00\n\n\n\n\n\n8 votes"}, {"index": 59, "position": "60", "title": "Sky is the Limit (feat. Donny Goines)", "vote": "Rate\n\n\n7.88\n\n\n\n\n\n8 votes"}, {"index": 60, "position": "61", "title": "CRY FOR LOVE", "vote": "Rate\n\n\n8.71\n\n\n\n\n\n7 votes"}, {"index": 61, "position": "62", "title": "MECHA BLECKA", "vote": "Rate\n\n\n8.71\n\n\n\n\n\n7 votes"}, {"index": 62, "position": "63", "title": "ROBOT PEOPLE MONSTER", "vote": "Rate\n\n\n8.14\n\n\n\n\n\n7 votes"}, {"index": 63, "position": "64", "title": "ZEITGEIST", "vote": "Rate\n\n\n8.14\n\n\n\n\n\n7 votes"}, {"index": 64, "position": "65", "title": "Konami Kode (feat. Donny Goines)", "vote": "Rate\n\n\n7.86\n\n\n\n\n\n7 votes"}, {"index": 65, "position": "66", "title": "ROLLERCOASTER", "vote": "Rate\n\n\n7.86\n\n\n\n\n\n7 votes"}, {"index": 66, "position": "67", "title": "OCARINE", "vote": "Rate\n\n\n8.83\n\n\n\n\n\n6 votes"}, {"index": 67, "position": "68", "title": "BACH TO THE PHUTURE", "vote": "Rate\n\n\n7.57\n\n\n\n\n\n7 votes"}, {"index": 68, "position": "69", "title": "PARTY MACHINE", "vote": "Rate\n\n\n8.50\n\n\n\n\n\n6 votes"}, {"index": 69, "position": "70", "title": "EGGS", "vote": "Rate\n\n\n8.33\n\n\n\n\n\n6 votes"}, {"index": 70, "position": "71", "title": "GUNSLINGER JONES", "vote": "Rate\n\n\n8.33\n\n\n\n\n\n6 votes"}, {"index": 71, "position": "72", "title": "Hungry Eyes (feat. Qwentalis)", "vote": "Rate\n\n\n7.14\n\n\n\n\n\n7 votes"}, {"index": 72, "position": "73", "title": "Light Years (feat. Razihel)", "vote": "Rate\n\n\n8.00\n\n\n\n\n\n6 votes"}, {"index": 73, "position": "74", "title": "RABBIT WHORE", "vote": "Rate\n\n\n9.00\n\n\n\n\n\n5 votes"}, {"index": 74, "position": "75", "title": "Manslaughter (feat Svanur Papparazzi)", "vote": "Rate\n\n\n7.50\n\n\n\n\n\n6 votes"}, {"index": 75, "position": "76", "title": "HEART-SHAPED MUSHROOM CLOUD", "vote": "Rate\n\n\n8.40\n\n\n\n\n\n5 votes"}, {"index": 76, "position": "77", "title": "OMNI", "vote": "Rate\n\n\n8.20\n\n\n\n\n\n5 votes"}, {"index": 77, "position": "78", "title": "SYKO", "vote": "Rate\n\n\n8.20\n\n\n\n\n\n5 votes"}, {"index": 78, "position": "79", "title": "THE A TEAM", "vote": "Rate\n\n\n8.20\n\n\n\n\n\n5 votes"}, {"index": 79, "position": "80", "title": "Witchcraft", "vote": "Rate\n\n\n8.20\n\n\n\n\n\n5 votes"}, {"index": 80, "position": "81", "title": "Shark", "vote": "Rate\n\n\n9.25\n\n\n\n\n\n4 votes"}, {"index": 81, "position": "82", "title": "QUANTUM MECHANICS", "vote": "Rate\n\n\n7.20\n\n\n\n\n\n5 votes"}, {"index": 82, "position": "83", "title": "I WANT YOU", "vote": "Rate\n\n\n8.00\n\n\n\n\n\n4 votes"}, {"index": 83, "position": "84", "title": "MAKE YOU DREAM", "vote": "Rate\n\n\n7.00\n\n\n\n\n\n5 votes"}, {"index": 84, "position": "85", "title": "SLAUGHTERFACE", "vote": "Rate\n\n\n5.83\n\n\n\n\n\n6 votes"}, {"index": 85, "position": "86", "title": "Shark", "vote": "Rate\n\n\n0.00\n\n\n\n\n\n0 votes"}, {"index": 86, "position": "87", "title": "Wade in the Water", "vote": "Rate\n\n\n0.00\n\n\n\n\n\n0 votes"}, {"index": 87, "position": "88", "title": "Wildstyle", "vote": "Rate\n\n\n0.00\n\n\n\n\n\n0 votes"}]}'
		@response2 = JSON.pretty_generate(JSON.parse(raw_response2))
		@desc2 = {:position => "Position of the item in the list.", :title => "Title of the item on the list.", :vote => "Number of votes for the specific item in the list."}

		@api_title3 = "Search"
		@api_maindesc3 = "This API call returns lists found given a search query."
		@raw_request3 = 'curl http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/virtualapi/listnerd/?username=api_test\&api_key=3cec1a36f3cb9c7a24216afe71a7aa8c720255fb\&method=search\&path=fun'
		raw_response3 = '{"meta": {"limit": 1000, "next": null, "offset": 0, "previous": null, "total_count": 12}, "objects": [{"description": "A venture funded company is any company which has received funding from a venture capital investor.", "index": 0, "meta": "1.188 views\n 623 votes\n 27.11.12", "name": "Best Venture Funded Company of All Time"}, {"description": "Fan of Knock Knock jokes? Bored at work and hungry for a laugh? Or just feeling down? Then look no further; weve compiled a massive list of the absolutely best Knock Knock jokes! Find your favorite? Then vote on the best Knock Knock jokes below. If your favorite isnt listed, you can also add a new joke to our selection of Knock Knock jokes.", "index": 1, "meta": "142 views\n 623 votes\n 16.09.13", "name": "Funny Knock Knock jokes"}, {"description": "", "index": 2, "meta": "133 views\n 623 votes\n 27.11.12", "name": "Best fun of All Time"}, {"description": "A defunct sports team is a sports team that no longer exists.", "index": 3, "meta": "98 views\n 621 votes\n 27.11.12", "name": "Best Defunct Sports Team of All Time"}, {"description": "A defunct organization is an organization that no longer operates.", "index": 4, "meta": "530 views\n 619 votes\n 27.11.12", "name": "Best Defunct Organization of All Time"}, {"description": "Fan of Dog jokes? Bored at work and hungry for a laugh? Or just feeling down? Then look no further; weve compiled a massive list of the absolutely best Dog jokes! Find your favorite? Then vote on the best Dog jokes below. If your favorite isnt listed, you can also add a new joke to our selection of Dog jokes.", "index": 5, "meta": "70 views\n 574 votes\n 16.09.13", "name": "Funny Dog jokes"}, {"description": "the general reason, purpose for the building at any time. Usually, it is why it was built.", "index": 6, "meta": "179 views\n 516 votes\n 27.11.12", "name": "Best Building function of All Time"}, {"description": "Fan of Blonde jokes? Bored at work and hungry for a laugh? Or just feeling down? Then look no further; weve compiled a massive list of the absolutely best Blonde jokes! Find your favorite? Then vote on the best Blonde jokes below. If your favorite isnt listed, you can also add a new joke to our selection of Blonde jokes.", "index": 7, "meta": "37 views\n 501 votes\n 16.09.13", "name": "Funny Blonde jokes"}, {"description": "Fan of Yo momma jokes? Bored at work and hungry for a laugh? Or just feeling down? Then look no further; weve compiled a massive list of the absolutely best Yo momma jokes! Find your favorite? Then vote on the best Yo momma jokes below. If your favorite isnt listed, you can also add a new joke to our selection of Yo momma jokes.", "index": 8, "meta": "46 views\n 480 votes\n 16.09.13", "name": "Funny Yo momma jokes"}, {"description": "Fan of School jokes? Bored at work and hungry for a laugh? Or just feeling down? Then look no further; weve compiled a massive list of the absolutely best School jokes! Find your favorite? Then vote on the best School jokes below. If your favorite isnt listed, you can also add a new joke to our selection of School jokes.", "index": 9, "meta": "49 views\n 465 votes\n 16.09.13", "name": "Funny School jokes"}, {"description": "Fan of Insect jokes? Bored at work and hungry for a laugh? Or just feeling down? Then look no further; weve compiled a massive list of the absolutely best Insect jokes! Find your favorite? Then vote on the best Insect jokes below. If your favorite isnt listed, you can also add a new joke to our selection of Insect jokes.", "index": 10, "meta": "48 views\n 443 votes\n 16.09.13", "name": "Funny Insect jokes"}, {"description": "Fan of Dirty jokes? Bored at work and hungry for a laugh? Or just feeling down? Then look no further; weve compiled a massive list of the absolutely best Dirty jokes! Find your favorite? Then vote on the best Dirty jokes below. If your favorite isnt listed, you can also add a new joke to our selection of Dirty jokes.", "index": 11, "meta": "53 views\n 435 votes\n 16.09.13", "name": "Funny Dirty jokes"}]}'
		@response3 = JSON.pretty_generate(JSON.parse(raw_response3))
		@desc3 = {:name => "The name of the specific list.", :description => "The description of the specific list.", :meta => "Displays the number of votes and views for the specific list."}
	end

end

def new

	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])
	
end 


def settings
	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])

	if not @user.nil?
		@username = @user.name
		@company = @user.company
	else
		@username = "Demo"
		@company = "Clicktree"
	end
	
end

def signup
	@email_signup = ""
	@name_signup = ""
	@email_signin = ""
end

def submitsignup
	user = Authentication.where("email = ?", params[:email])

	if user.length == 0
		if not params[:name].blank? and not params[:email_signup].blank? and not params[:password_signup].blank? and not params[:confirm_password].blank?
			if params[:password_signup] == params[:confirm_password]
				auth = Authentication.create(email: params[:email_signup], password: params[:password_signup])
				user = User.create(name: params[:name], status: 2, authentication_id: auth.id)

				session[:id] = user.id
				redirect_to :action => 'dashboard' and return

			else
				flash.now[:signup_error] = "Passwords do not match!"
				@email_signup = params[:email_signup]
				@name_signup = params[:name]
				respond_to do |format|
					format.html {render 'signup'}
				end
			end
		else
			flash.now[:signup_error] = "Please fill in all values!"
			@email_signup = params[:email_signup]
			@name_signup = params[:name]
			respond_to do |format|
				format.html {render 'signup'}
			end
		end
	else
		flash.now[:signup_error] = "Email already exists!"
		@email_signup = params[:email_signup]
		@name_signup = params[:name]
		respond_to do |format|
			format.html {render 'signup'}
		end
	end
end

def apiexplorer
	params[:id] = session[:id] if params[:id].nil?
	@user = User.find_by_authentication_id(params[:id])

	if not @user.nil?
		@username = @user.name
		@company = @user.company
	else
		@username = "Demo"
		@company = "Clicktree"
	end
end

def submitsignin
	user = Authentication.where("email = ? AND password = ?", params[:email], params[:password])

	if user.length > 0
		session[:id] = user.first.id
		redirect_to :action => 'dashboard' and return
	else
		flash.now[:signin_error] = "Incorrect email and password combination!"
		@email_signin = params[:email]
		respond_to do |format|
			format.html {render 'signup'}
		end
	end
 end

end
