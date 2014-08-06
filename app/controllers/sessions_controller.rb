class SessionsController < ApplicationController
	def new
		@login = Login.new
		@is_login = true
	end

	def create
		#find the user that is trying to login

		u = Login.where(username: params[:login][:username]).first
		# if they type the password correctly
		if u && u.authenticate(params[:login][:password])
			
			#if the condition is met
			#store as a cookie in the users browser the id of them
			#indicating that they are logged in
			session[:login_id] = u.id.to_s
			@current_login = u
			@mainorderboard = Mainorderboard.where(:login_id => @current_login.id).first

			if @maidorderboard != nil
				redirect_to login_mainorderboard_path(@current_login.id, @mainorderboard.id)
			else
				redirect_to new_login_mainorderboard_path(@current_login)
			end
		else

			# go back to the login page
			redirect_to new_session_path
		end
	end

	def destroy
		reset_session
		redirect_to logins_path
	end
end