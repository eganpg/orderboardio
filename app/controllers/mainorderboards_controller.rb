 class MainorderboardsController < ApplicationController
	def index
		@login = Login.find(params[:login_id])	
		@mainorderboards = @login.mainorderboards
	end

	def show
		
		@mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
		
	end

	
	def new
		@login = Login.find(params[:login_id])
		@mainorderboard = Mainorderboard.new
		
	end

	def create
		@suborder = Suborder.new
		@mainorderboard = current_user.mainorderboards.new(
			params.require(:mainorderboard).permit(:name)
			)
		if @mainorderboard.save
			redirect_to mainorderboard_suborders_path(@mainorderboard.id)

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

