# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	@@quotes=[
		"... with a name .com hipsters love!",
		"... what's \"Articl\" in Spanish anyway?",
		"... my cousin works for Bit.ly",
		"... not just for the country of Spain",
	]
	
	def random_quote
		@@quotes[rand(@@quotes.length)]
	end
end
