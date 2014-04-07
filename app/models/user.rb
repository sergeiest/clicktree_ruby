class User < ActiveRecord::Base
	belongs_to :authentication
	has_many :apicalls, dependent: :destroy
end
