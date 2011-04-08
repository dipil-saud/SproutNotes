class HowTosController < ApplicationController

  before_filter :authenticate_user! , :except => [:index, :show]

  def index
    if params[:attribute] && params[:order] && params[:search]
      @how_tos = HowTo.search(params[:search]).order_by(params[:attribute], params[:order])
    elsif params[:attribute] && params[:order]
      @how_tos = HowTo.order_by(params[:attribute], params[:order])
    elsif params[:search]
      @how_tos = HowTo.search(params[:search])
    else
      @how_tos = HowTo.order_by("created_at", "DESC")
    end
  end

  def show
     @how_to = HowTo.find(params[:id])
  end

  def new
    @how_to = current_user.how_tos.build
  end

  def create
    @how_to = current_user.how_tos.new(params[:how_to])
    if @how_to.save
      flash[:notice] = "#{@how_to.title} Successfully Created"
      redirect_to how_to_path( @how_to )
    else
      render 'new'
    end
  end

  def edit
    @how_to = current_user.how_tos.find(params[:id])
  end

  def update
    @how_to = current_user.how_tos.find(params[:id])
    if @how_to.update_attributes(params[:how_to])
      flash[:notice] = "Successfully Updated"
      redirect_to how_to_path( @how_to )
    else
      render 'edit'
    end
  end

  def destroy
    how_to = current_user.how_tos.find(params[:id])
    how_to.destroy
    flash[:notice] = "#{how_to.title} Successfully Deleted"
    redirect_to user_root_path
  end

end
