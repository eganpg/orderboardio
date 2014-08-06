class ProductsController < ApplicationController
	def index
		@product = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new(params.require(:product).permit(:name, :price, :description, :picture, :unit))
	end
end
