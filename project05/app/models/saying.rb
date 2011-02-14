class Saying < ActiveRecord::Base

	def self.random_quote
		self.find(1+rand(self.count)).quote
	end
end
