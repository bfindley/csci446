roles=[
	{ :name => "admin" },
	{ :name => "member" }
]
Role.delete_all
roles.each do |t|
	Role.create(t)
end

accounts=[
  { :username => "administrator", :password => "password", :email => "bfindley@mines.edu", :password_confirmation => "password", :first_name => "Brian", :last_name => "Findley", :role_id => Role.find_by_name("admin").id} ,
  { :username => "member", :password => "password", :email => "jdoe@mines.edu", :password_confirmation => "password", :first_name => "John", :last_name => "Doe", :role_id => Role.find_by_name("member").id}
]
User.delete_all
accounts.each do |t|
  User.create_from_seed(t)
end

games=[
  { :title => "Halo", :rating => 1, :user_id => 1 },
  { :title => "Final Fantasy 1", :rating => 0, :user_id => 1 },
  { :title => "Final Fantasy 2", :rating => 1, :user_id => 2 },
  { :title => "Final Fantasy 3", :rating => 2, :user_id => 1 },
  { :title => "Final Fantasy 4", :rating => 3, :user_id => 2 },
  { :title => "Final Fantasy 5", :rating => 1, :user_id => 1 },
  { :title => "Final Fantasy 6", :rating => 3, :user_id => 2 },
  { :title => "Connect 4", :rating => 3, :user_id => 1 },
  { :title => "Pong", :rating => 3, :user_id => 2 },
  { :title => "Halo 2", :rating => 0, :user_id => 2 },
  { :title => "Tetris", :rating => 1, :user_id => 1 }
]
Game.delete_all
games.each do |t|
  Game.create(t)
end