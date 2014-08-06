class SubordersController < ApplicationController
 
  def index
    
    @mainorderboards = current_user.mainorderboards
    @suborder = Suborder.all
  end

  def show
    
    @mainorderboard = Mainorderboard.find(params[:mainorderboard_id])
    @suborder = Suborder.new
  end
  
  def new
    @current_user = current_user
    @mainorderboards = current_user.mainorderboards
    @suborder = Suborder.new
  end

  def create
    
    @mainorderboard = current_user.mainorderboards
    @suborder = current_user.suborders.new(
      params.require(:suborder).permit(:vendorname, :email)
      )
    if @suborder.save
      redirect_to mainorderboard_suborder_path(@mainorderboard.id, @suborder.id)


    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
