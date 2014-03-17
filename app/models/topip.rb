class Topip < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	has_many :timerequests, dependent: :destroy
	has_many :sigmamus, dependent: :destroy
end
