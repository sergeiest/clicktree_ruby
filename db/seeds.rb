# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

Dailyrequest.destroy_all
data_array = Array.new()

for k in 2..3
	for j in 1..5
		for i in 1..20
			data_row = Dailyrequest.new
			data_row.company_id = k
			case j
				when 1
					data_row.name = "Users"
				when 2
					data_row.name = "Indexing"
				when 3
					data_row.name = "Bots"
				when 4
					data_row.name = "Automated"
				when 5
					data_row.name = "Developers"
			end
			data_row.value = ((-1)^(k%2)*2*j + i ^ (1 - 2*(j % 3))).to_f
			data_row.type_id = j
			data_row.rdate = "2014-1-" + i.to_s
			data_array << data_row
		end
	end
end

data_array.each do |data_row|
	data_row.save
end


Hourrequest.destroy_all
data_array = Array.new()
for k in 2..3
	for j in 1..5
		for i in 1..20
			data_row = Hourrequest.new
			data_row.company_id = k
			case j
				when 1
					data_row.name = "Users"
				when 2
					data_row.name = "Indexing"
				when 3
					data_row.name = "Bots"
				when 4
					data_row.name = "Automated"
				when 5
					data_row.name = "Developers"
			end
			data_row.value = ((-1)^(k%2)*10*j + i ^ (1 - 2*(j % 2))).to_f
			data_row.type_id = j
			data_row.rdate = "2014-1-1 " + i.to_s + ":00:00"
			data_array << data_row
		end
	end
end

data_array.each do |data_row|
	data_row.save
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

