class Article < ActiveRecord::Base
	validates_presence_of :title, :author, :body
	validate :author_not_Sally
	

	protected
		# Denied acces if author's first name is sally
		def author_not_Sally
			if(author.downcase.chomp.split(' ')[0]=="sally")
				errors.add("You might have broken my heart in second grade therefore your article ") 
			end
		end
end
