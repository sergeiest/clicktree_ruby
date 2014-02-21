# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


data_array = Array.new()
for k in 1..3
	for i in 1..20
		data_array << [k, "Users", 1, 700 + rand(20), "2014-1-" + i.to_s]
		data_array << [k, "Indexing", 2, 200 + rand(50), "2014-1-" + i.to_s]
		data_array << [k, "Bots", 3, 200 + rand(100), "2014-1-" + i.to_s]
		data_array << [k, "Automated", 4, 300 + rand(20), "2014-1-" + i.to_s]
		data_array << [k, "Developers", 5, 400 + rand(10), "2014-1-" + i.to_s]
	end
end

Dailyrequest.destroy_all
data_array.each do |company_id, name, type_id, value, rdate|
  Dailyrequest.create( company_id: company_id, name: name, type_id: type_id, value: value, rdate: rdate)
end


data_array = Array.new()
for k in 1..3
	for i in 1..20
		data_array << [k, "Users", 1, 700 + rand(20), "2014-1-1 " + i.to_s + ":00:00"]
		data_array << [k, "Indexing", 2, 200 + rand(50), "2014-1-1 " + i.to_s + ":00:00"]
		data_array << [k, "Bots", 3, 200 + rand(100), "2014-1-1 " + i.to_s + ":00:00"]
		data_array << [k, "Automated", 4, 300 + rand(20), "2014-1-1 " + i.to_s + ":00:00"]
		data_array << [k, "Developers", 5, 400 + rand(10), "2014-1-1 " + i.to_s + ":00:00"]
	end
end

Hourrequest.destroy_all
data_array.each do |company_id, name, type_id, value, rdate|
  Hourrequest.create( company_id: company_id, name: name, type_id: type_id, value: value, rdate: rdate)
end

topip_list = Array.new()
for k in 1..3
	for i in 1..5
		topip_list << [ k, "Company " + i.to_s, rand(255).to_s + '.' + rand(255).to_s + '.' + rand(255).to_s + '.' + rand(255).to_s,
		  			rand(1000), 3]
	end
end

Topip.destroy_all
topip_list.each do |company_id, title, ipaddress, request, type_id|
  Topip.create( company_id: company_id, title: title, ipaddress: ipaddress, request: request, type_id: type_id)
end

requesttype_list = Array.new()
for k in 1..3
	requesttype_list << [ k, "Users", 1, rand(100)]
	requesttype_list << [ k, "Indexing", 2, rand(100)]
	requesttype_list << [ k, "Bots", 3, rand(100)]
	requesttype_list << [ k, "Automated", 4, rand(100)]
	requesttype_list << [ k, "Developers", 5, rand(100)]
end

Requesttype.destroy_all
Iptype.destroy_all
requesttype_list.each do |company_id, name, type_id, value|
  Requesttype.create( company_id: company_id, name: name, value: value, type_id: type_id)
  Iptype.create( company_id: company_id, name: name, value: value, type_id: type_id)
end


authentication_list = [
  [ "team@clicktreelabs.com", "111" ],
  [ "beta@customer1.com", "111" ],
  [ "beta@customer2.com", "222" ]
]

Authentication.destroy_all
authentication_list.each do |email, password|
  Authentication.create( email: email, password: password )
end

user_list = [
  [ "Team", "Clicktree", 1 ],
  [ "Cristiano", "Snip2Code", 2 ],
  [ "Erling", "Picturegr.am", 3 ]
]

User.destroy_all
user_list.each do |name, company, authentication_id|
  User.create( name: name, company: company, authentication_id: authentication_id )
end

