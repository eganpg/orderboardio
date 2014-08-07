class SubordersController < ApplicationController
 
  def index
    
    @mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
    @suborders = @mainorderboard.suborders
  end

  def show
    
   
    @mainorderboard = Mainorderboard.find(params[:mainorderboard_id])
    @suborder = Suborder.find(params[:id])
    

    
    
  end
  
  def new
    # @current_user = current_user.mainorderboards
    @mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
    @suborder = Suborder.new
  end

  def create
    @mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
    @suborder = @mainorderboard.suborders.new(
      params.require(:suborder).permit(:vendorname, :email)
      )
    if @suborder.save
      redirect_to mainorderboard_suborders_path(@mainorderboard.id)



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
