class QuestionsController < ApplicationController

  before_filter :authenticate_user! , :except => [:index, :show]
  PER_PAGE = 4

  def index
    if params[:category]
      if params[:category] == "*"
        @questions = Question.where("id")
      else
        category = Category.find_by_id(params[:category])
        @questions = category.questions
      end
    else
      @questions = Question.where("id")
    end
    if params[:attribute] && params[:order] && params[:search]
      @questions = @questions.search(params[:search]).order_by(params[:attribute], params[:order])
    elsif params[:attribute] && params[:order]
      @questions = @questions.order_by(params[:attribute], params[:order])
    else
      @questions = @questions.order_by("created_at", "DESC")
    end
    @questions = @questions.page(params[:page]).per(PER_PAGE)
  end

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

end
