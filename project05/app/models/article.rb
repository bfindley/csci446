class Article < ActiveRecord::Base
	belongs_to :author

	before_save :increment_edits

	validates_presence_of :title, :author_id, :body
	
	def self.display_articles(page)
		paginate(:per_page => 10, :page=> page, :include => :author)
	end
	
	private
		def increment_edits
			self.updates += 1 unless self.new_record?
		end
end
