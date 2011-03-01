roles=[
	{ :name => "Admin" },
	{ :name => "Member" }
]
Role.delete_all
roles.each do |t|
	Role.create(t)
end

accounts=[
  { :username => "administrator", :password => "password", :email => "bfindley@mines.edu", :password_confirmation => "password", :first_name => "Brian", :last_name => "Findley", :role_id => Role.find_by_name("Admin").id} ,
  { :username => "member", :password => "password", :email => "jdoe@mines.edu", :password_confirmation => "password", :first_name => "John", :last_name => "Doe", :role_id => Role.find_by_name("Member").id}
]
User.delete_all
accounts.each do |t|
  User.create_from_seed(t)
end