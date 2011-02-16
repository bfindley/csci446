class Article < ActiveRecord::Base
	belongs_to :author

	before_save :increment_edits

	validates_presence_of :title, :author_id, :body
	
	@@quotes=[
		"... with a name .com hipsters love!",
		"... what's \"Articl\" in Spanish anyway?",
		"... my cousin works for Bit.ly",
		"... not just for the country of Spain",
	]
	
	def self.display_articles(page)
		paginate(:per_page => 10, :page=> page, :include => :author)
	end
	
	def self.random_quote
		@@quotes[rand(@@quotes.length)]
  	end

	private
		def increment_edits
			self.updates += 1 unless self.new_record?
		end
end
