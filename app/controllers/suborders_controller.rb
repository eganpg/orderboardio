class SubordersController < ApplicationController
 
  def index
    @login = Login.where(id: params[:login_id]).first
    @suborder = Suborder.new
    @suborder = @login.suborders



  end

  def show
    @login = Login.where(id: params[:login_id]).first
    @mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
    @suborder = @login.suborders

  end
  
  def new
    @login = Login.where(id: params[:login_id]).first
    @suborder = Suborder.new
  end

  def create
    
    @login = Login.where(id: params[:login_id]).first
    @suborder = @login.suborders.new(
      params.require(:suborder).permit(:vendorname, :email)
      )
    if @suborder.save
      redirect_to login_suborders_path(@login.id)
    else
      render 'new'
    end
  end

  def edit
    @login = Login.where(id: params[:login_id]).first
    @suborder = @login.suborders
  end

  def update
    @login = Login.where(id: params[:login_id]).first
    # @itemname = Suborder.new(params.require(:suborder).permit(:itemname.to_s))

    @suborder = @login.suborders.find(params[:id])
    if @suborder.update_attributes(params.require(:suborder).permit(:itemname))
      
    else
      render 'edit'
    end
  end

  def destroy
    @login = Login.where(id: params[:login_id]).first
    @suborder = @login.suborders.find(params[:id])
    @suborder.destroy
    redirect_to login_suborders_path(@login.id)
  end
end
