# include FactoryBot::Syntax::Methods
# require 'factories'

# Default admin user and some sample users
create(:user, username: "Chris", email: "chris@example.com" )
5.times { create(:user) }
