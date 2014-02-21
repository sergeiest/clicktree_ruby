class Authentication < ActiveRecord::Base
	has_one :user
end
