quotes=[
	"... with a name .com hipsters love!",
	"... what's \"Articl\" in Spanish anyway?",
	"... my cousin works for Bit.ly",
	"... not just for the country of Spain",
]

Saying.delete_all
quotes.each do |t|
	Saying.find_or_create_by_quote(t)
end