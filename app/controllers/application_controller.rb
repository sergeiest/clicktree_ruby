require 'net/http'
require 'uri'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter do
  		uri = URI.parse("http://ec2-50-18-201-41.us-west-1.compute.amazonaws.com/api/v1/request/?username=#{ENV['sourceusername']}&api_key=#{ENV['api_key']}")

  		headers = {'Content-Type'=>'application/json','Accept-Encoding'=>'gzip,deflate','Accept'=> 'application/json'}
  		http = Net::HTTP.new(uri.host,uri.port)
  		data = {"userid"=>"-1", "host"=>"clicktreelabs.com", "url"=>request.original_url, "method"=>request.request_method, "useragent"=>request.user_agent, "ip"=>request.remote_ip}.to_json

  		response = http.post("#{uri.path}?#{uri.query}",data,headers)

      @allblocks = Blockedip.pluck(:ip)

      if @allblocks.include? request.remote_ip
        render :text => "You are not authorized"
        return 
      end

  end
end
