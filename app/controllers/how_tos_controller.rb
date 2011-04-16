class HowTosController < ApplicationController

  before_filter :authenticate_user! , :except => [:index, :show]
  autocomplete :category, :name

  def index
    if params[:category]
      if params[:category] == "*"
        @how_tos = HowTo.where("id")
      else
        category = Category.find_by_id(params[:category])
        @how_tos = category.how_tos
      end
    else
      @how_tos = HowTo.where("id")
    end
    if params[:attribute] && params[:order] && params[:search]
      @how_tos = @how_tos.search(params[:search]).order_by(params[:attribute], params[:order])
    elsif params[:attribute] && params[:order]
      @how_tos = @how_tos.order_by(params[:attribute], params[:order])
    elsif params[:search]
      @how_tos = @how_tos.search(params[:search])
    else
      @how_tos = @how_tos.order_by("created_at", "DESC")
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

  def like
    @how_to = HowTo.find(params[:how_to_id])
    @how_to.likes = @how_to.likes + 1
    @how_to.save
    session[@how_to.id] = true
    respond_to do |format|
      format.html { redirect_to how_to_path(@how_to) }
      format.js
    end

  end

end
