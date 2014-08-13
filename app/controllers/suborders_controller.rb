class SubordersController < ApplicationController
 
  def index
    
    @mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
    
    @suborder = Suborder.all
  end

  def show
    
    @mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
    @suborder = @mainorderboard.suborders
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
      redirect_to mainorderboard_suborder_path(@mainorderboard.id, @suborder.id)
    else
      render 'new'
    end
  end

  def add
    @mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
    @suborder = @suborder.all
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
