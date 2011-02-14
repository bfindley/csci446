class Article < ActiveRecord::Base
	before_save :increment_edits
	
	validates_presence_of :title, :author, :body
	validate :author_not_Sally

	private
		def increment_edits
			self.updates += 1 unless self.new_record?
		end
	
		# Denied acces if author's first name is sally
		def author_not_Sally
			if(author.downcase.chomp.index("sally"))
				errors.add("You might have broken my heart in second grade therefore your article ") 
			end
		end
end
