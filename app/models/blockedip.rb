require 'net/http'
require 'uri'

class Blockedip < ActiveRecord::Base
	def updateIPs
		maxid = Blockedip.all.maximum(:apiid)

		if maxid.nil?
			uri = URI.parse("http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/block/blockedip/?username=#{ENV['sourceusername']}&api_key=#{ENV['api_key']}")
		else
			uri = URI.parse("http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/block/blockedip/?username=#{ENV['sourceusername']}&api_key=#{ENV['api_key']}&index=#{maxid}")
		end

		headers = {'Accept'=>'application/json'}
		http = Net::HTTP.Get.new(uri.path)

		response = http.get(uri)
	end
end