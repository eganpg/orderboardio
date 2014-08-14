class SubordersController < ApplicationController
 
  def index
    @login = Login.where(id: params[:login_id]).first
    @mainorderboard = Mainorderboard.where(id: params[:mainorderboard_id]).first
    
    @suborder = Suborder.all
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
      redirect_to login_suborder_path(@login.id, @suborder.id)
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
