class Author < ActiveRecord::Base
	has_many :article

	validates_presence_of :author_name
	validates_attachment_presence :photo
	validates_attachment_size :photo, :less_than => 3.megabytes
	validates_attachment_content_type :photo, :content_type=> ['image/jpeg', 'image/png', 'image/gif']
	validate :author_not_Sally
	
	has_attached_file :photo, :styles => { :small => "300x300>" }
	
	def self.display_authors(page)
		paginate(:per_page => 10, :page=> page)
	end
	
	private
		# Denied acces if author's first name is sally
		def author_not_Sally
			if(author_name.downcase.chomp.index("sally"))
				errors.add("You might have broken my heart in second grade therefore your article ") 
			end
		end
end
