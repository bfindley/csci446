authors=[
	{ :author_name => "Douglas Adams", :photo_file_name => "douglasadams.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 23242 },
	{ :author_name => "Orson Scott Card", :photo_file_name => "orson.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 9274 },
	{ :author_name => "Mark Twain", :photo_file_name => "twain.jpg", :photo_content_type => "image/jpeg", :photo_file_size => 34494 }
]

articles=[
	{ :title => "Ender's Game", :updates => 0, :created_at => "2011-02-15 18:16:40", :updated_at => "2011-02-15 18:16:40", :author_id => 2, :body => "In the novel's opening, " },
	{ :title => "Tom Sawyer", :author_id => 3, :body => "Twain began his career writing light, humorous verse, but evolved into a chronicler of the vanities, hypocrisies and murderous acts of mankind. At mid-career, with Huckleberry Finn, he combined rich humor, sturdy narrative and social criticism. Twain was a master at rendering colloquial speech and helped to create and popularize a distinctive American literature built on American themes and language. Many of Twain's works have been suppressed at times for various reasons. Adventures of Huckleberry Finn has been repeatedly restricted in American high schools, not least for its frequent use of the word nigger, which was in common usage in the pre-Civil War period in which the novel was set." },
	{ :title => "The Hitchhiker's Guide to the Galaxy", :author_id => 1, :body => "The Hitchhiker's Guide to the Galaxy is a science fiction comedy series created by English writer, dramatist, and musician Douglas Adams. Originally a radio comedy broadcast on BBC Radio 4 in 1978, it was later adapted to other formats, and over several years it gradually became an international multi-media phenomenon. Adaptations have included stage shows, a trilogy of five books published between 1979 and 1992, a sixth novel penned by Eoin Colfer in 2009, a 1981 TV series, a 1984 computer game, and three series of three-part comic book adaptations of the first three novels published by DC Comics between 1993 and 1996." }
]

Author.delete_all
authors.each do |t|
	Author.create(t)
end

Article.delete_all
articles.each do |t|
	Article.create!(t)
end
