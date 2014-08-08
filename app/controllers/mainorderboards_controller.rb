 class MainorderboardsController < ApplicationController
	def index
			
		@mainorderboards = current_user.mainorderboards
	end

	def show
		
		@login = Login.find(params[:login_id])
		@mainorderboards = current_user.mainorderboards
	end

	
	def new
		@login = Login.find(params[:login_id])
		@mainorderboard = Mainorderboard.new
		
	end

	def create
		
		@mainorderboards = current_user.mainorderboards.new(
			params.require(:mainorderboard).permit(:name)
			)
		if @mainorderboards.save
			redirect_to login_mainorderboards_path(@current_user.id)

		else
			render 'new'
		end
	end
	





	def destroy
		@mainorderboard = Mainorderboard.find(params[:id])
		@mainorderboard.destroy
		redirect_to mainorderboards_path
	end
end

	# def edit 
	# 	@login = Login.find(params[:id])
	# end

	# def update
	# 	@login = Login.find(params[:id])
	# 	if @login.update_attributes(params.require(:login).permit(:firstName, :lastName, :email))
	# 		redirect_to logins_path
	# 	else
	# 		render 'edit'
	# 	end
	# end

	# def destroy
	# 	@login = Login.find(params[:id])
	# 	@logins.destroy
	# 	redirect_to logins_path
	# end

