--Count User
Login.count

--Create a User
l = Login.new(username: "peter", password: "taco")

--This is a hash generator
BCrypt::Engine.generate_salt

--Should output
=> "$2a$10$fP4kdsYbwACF6ySwcvduY."

--Generate Salt
salt = BCrypt::Engine.generate_salt

--This is the output
irb(main):010:0* BCrypt::Engine.hash_secret("taco", salt)
=> "$2a$10$l5.MBhdTlYV7XBDCLayKJu0NtfDo.IVp5pgdC7zmYcw3k1ZxxROQe"


--Go to your model and change it to look like this (see dashes)
class Login
  include Mongoid::Document
-  include ActiveModel::SecurePassword
  field :firstName, type: String
  field :lastName, type: String
  field :username, type: String
  field :password_digest, type: String

-  has_secure_password
end


-- do this reload! command
irb(main):012:0> reload!
Reloading...
=> true

-- Just do this
exit and reenter rails c

--Do a test to see if this works, it should
irb(main):002:0> u = Login.new(username:"fred@awesome.com", password: "taco")
=> #<Login _id: 53e16b08506574cf9b000000, firstName: nil, lastName: nil, username: "fred@awesome.com", password_digest: "$2a$10$U4JS7bNaHlsm45a1qiJRI.SkfqRYGM0Y2r9wFkgsobfXQX/14SPqm">

--login views
<h1>Sign up for our site</h1>

<%= form_for @login do |l| %>
	First Name: <%= l.text_field :firstName %>
	Last Name: <%= l.text_field :lastName %>
	Username: <%= l.text_field :username %>
	Password: <%= l.password_field :password, placeholder="password...." %>
	Password: <%= l.password_field :password_confirmation, placeholder="and again...." %>
	Add: <%= l.submit "Add" %>
	<% end %>

	<%= link_to "Back to the List", logins_path %>

--add to routes
resource :session, only: [:new, :create, :destroy]

-go to controller and make it look like this
def create
		@login = Login.new(params.require(:login).permit(:firstName, :lastName, :username, :password, :password_confirmation))
		if @login.save
			redirect_to logins_path
		else
			render 'new'
		end
	end

	--create user

	--test this in rails c
	peteregan ~/Desktop/new_company/orderBoardApp
$ rails c
Loading development environment (Rails 4.1.4)
irb(main):001:0> Login.last
=> #<Login _id: 53e171f9506574d007000000, firstName: "Frank", lastName: "Johnson", username: "frankjohnson", password_digest: "$2a$10$4DMBHsqZzFHVDu1MwZQhpO5XVqEX7OC9Rnc0pd00JPihdapFlTgW2">
irb(main):002:0> Login.last.authenticate('taco')
=> #<Login _id: 53e171f9506574d007000000, firstName: "Frank", lastName: "Johnson", username: "frankjohnson", password_digest: "$2a$10$4DMBHsqZzFHVDu1MwZQhpO5XVqEX7OC9Rnc0pd00JPihdapFlTgW2">
irb(main):003:0> Login.last.authenticate('burrito')
=> false
irb(main):004:0> 

--create a controller in controllers
sessions_controller.rb

--paste in code into newly created controller

class SessionsController < ApplicationController
	def new
		@user = User.new
		@is_login = true
	end

	def create
		u = User.where(email: params[:user][:email]).first
		if u && u.authenticate(params[:user][:password])
			session[:user_id] = u.id.to_s
			redirect_to decisions_path
		else
			redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		redirect_to decisions_path
	end
end


--place this in application layout
<%= session[:login_id].inspect %>

--copy logins new into a folder call sessions
- new.html.erb


--application.html.erb

<body>



<% if current_user %>
	Welcome, <%= current_user.username %>!
	<%= link_to "Log out", session_path, method: :delete %>
<% else %>
	<%= link_to "Sign up", new_login_path %>
	<%= link_to "Log in", new_session_path %>
<% end %>

<%= yield %>

</body>

