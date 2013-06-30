#create some roles and users
p "Creating admin roles"
role = Role.create(:name => "admin")
p "Creating admin user"
user = User.new(:email => "admin@boko.vn", 
	:password => "123456", :password_confirmation => "123456"
	)
user.confirm!
user.roles << role 
user.save

p "Creating normal user roles"
role = Role.create(:name => "user")
p "Creating normal users"
user = User.new(:email => "xuanchien@boko.vn",
	:password => "123456", :password_confirmation => "123456")
user.confirm!
user.roles << role 
user.save