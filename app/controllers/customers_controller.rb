class CustomersController < ApplicationController
		
		def index
			@customers = Customer.all
		end

		def new
			@customer = Customer.new
			@customer = Customer.where(:customer_id => @customer.id)
			@customer = current_user.customer

		end

		def create
			@customer = Customer.find(params[:customer_id])
			@customer = Customer.new(params.require(:customer_id).permit(:name, :email))
			puts '*********' + @customer.inspect
			if @customer.save
				redirect_to customer_path
			else
				render 'new'
			end
		end

		# def destroy
		# 	Decision.find(params[:id]).destroy
		# 	redirect_to :customer_path
		# end

end
