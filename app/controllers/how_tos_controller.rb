class HowTosController < ApplicationController

  def index
    @user = current_user
    @how_tos = current_user.how_tos
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
      redirect_to how_to_path( @how_to )
    else
      render 'edit'
    end
  end

  def destroy
    how_to = current_user.how_tos.find(params[:id])
    redirect_to how_tos_path
  end

end
