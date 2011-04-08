class QuestionsController < ApplicationController

  before_filter :authenticate_user! , :except => [:index, :show]

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
   @question = Question.find(params[:id])
  end

  def destroy
    question = current_user.questions.find(params[:id])
    flash[:notice] = "#{question.title} Successfully Deleted" if question.destroy
    redirect_to user_root_path
  end

  def index
    @questions = Question.all
  end

end
