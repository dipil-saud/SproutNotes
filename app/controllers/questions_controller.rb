class QuestionsController < ApplicationController

  def new
    @question = current_user.questions.build
  end

  def create
     @question = current_user.questions.new(params[:question])
      if @question.save
        flash[:notice] = "#{@question.title} Successfully Created"
        redirect_to question_path( @question )
      else
        render 'new'
      end
  end

  def show
   @question = current_user.questions.find(params[:id])
  end

  def destroy
    question = current_user.questions.find(params[:id])
    flash[:notice] = "#{question.title} Successfully Deleted" if question.destroy
    redirect_to user_path
  end

end
