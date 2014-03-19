class Topip < ActiveRecord::Base
	has_many :pages, dependent: :destroy
	has_many :timerequests, dependent: :destroy
	has_many :sigmamus, dependent: :destroy
	has_many :hourlyips, dependent: :destroy
	has_many :dailyips, dependent: :destroy
end
