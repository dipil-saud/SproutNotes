class CommentsController < ApplicationController
  def new
    @how_to= HowTo.find(params[:how_to_id])
     @comment = @how_to.comment.build
  end

  def create
    @
  end

end
