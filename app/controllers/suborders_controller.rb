class SubordersController < ApplicationController
 
  def index
    @suborder = Suborder.all
  end

  def show
    @login = Login.find(params[:login_id])
    @mainorderboard = Mainorderboard.find(params[:mainorderboard_id])
    @suborder = Suborder.new
  end
  def new
    
    @mainorderboard = Mainorderboard.find(params[:mainorderboard_id])
    @suborder = Suborder.new
  end
  def create
    @login = Login.find(params[:login_id])
    @mainorderboard = Mainorderboard.find(params[:mainorderboard_id])
    @suborder = Suborder.new(
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
