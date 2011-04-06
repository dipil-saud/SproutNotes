class CommentsController < ApplicationController

  def new
     @how_to= HowTo.find(params[:how_to_id])
     @comment = @how_to.comments.build
  end

  def create
    @how_to= HowTo.find(params[:how_to_id])
    @comment = @how_to.comments.new(params[:comment])
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html{redirect_to how_to_path(@how_to) }
        format.js
      end
    else
      respond_to do |format|
        format.html{ render 'new' }
        format.js { render :nothing => true }
      end
    end
  end

end
