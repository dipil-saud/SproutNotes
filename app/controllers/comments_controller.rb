class CommentsController < ApplicationController

  def new
    @commentable = find_commentable
    @comment = @commentable.comments.build
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user = current_user
    if @comment.save
      respond_to do |format|
        format.html{ commentable_redirect(@comment) }
        format.js
      end
    else
      respond_to do |format|
        format.html{ render 'new' }
        format.js { render :nothing => true }
      end
    end
  end

  def destroy
    commentable = find_commentable
    comment = commentable.comments.find(params[:id])
    comment.destroy
    commentable_redirect(comment)
  end

  private

  def commentable_redirect(comment)
    if comment.commentable_type == "HowTo"
       redirect_to how_to_path(comment.commentable)
    elsif comment.commentable_type == "Question"
       redirect_to question_path(comment.commentable)
    end
  end

  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

end
