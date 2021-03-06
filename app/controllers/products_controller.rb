class ProductsController < ApplicationController
	def index
		@login = Login.where(id: params[:login_id])
		@mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
		@suborder = Suborder.where(id: params[:suborder_id]).first	
		@products = @suborder.products
		
		
	end

	def show
		@suborder = Suborder.where(id: params[:suborder_id]).first
		@product = Product.find(params[:id])
	end

	def new
		@mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
		@suborder = Suborder.where(id: params[:suborder_id]).first
		@product = Product.new
	end

	def create
		@suborder = Suborder.where(id: params[:suborder_id]).first
		@product = @suborder.products.new(
			params.require(:product).permit(:name, :par, :onhand, :unit, :product_id => []))
		if @product.save
      redirect_to suborder_products_path(@suborder.id)
      else
      render 'new'
    end
	end
end
