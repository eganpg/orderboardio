class LoginsController < ApplicationController
	def index
		@login = Login.all
	end

	def show
		@login = Login.find(params[:id])
	end

	def new
		@login = Login.new
	end

	def create
		@login = Login.new(params.require(:login).permit(:firstName, :lastName, :username, :password, :password_confirmation))
		if @login.save
			redirect_to new_session_path
		else
			render 'new'
		end
	end

	def edit 
		@login = Login.find(params[:id])
	end

	def update
		@login = Login.find(params[:id])
		if @login.update_attributes(params.require(:login).permit(:firstName, :lastName, :email))
			redirect_to logins_path
		else
			render 'edit'
		end
	end

	def destroy
		@login = Login.find(params[:id])
		@logins.destroy
		redirect_to logins_path
	end

end
