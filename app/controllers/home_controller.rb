class HomeController < ApplicationController

  before_filter :authenticate_user! , :only => :user

  def index
    @how_tos = HowTo.order_by('created_at', 'DESC').limit(6)
  end

  def user
    @user = current_user
    @how_tos = current_user.how_tos
    @questions = current_user.questions
  end

  def search
    @how_tos = HowTo.search(params[:search])
  end

  def users
    @users = User.all
  end

  def user_show
    @user = User.find_by_id(params[:id])
    @how_tos = @user.how_tos
    @questions = @user.questions
    render 'user'
  end


end
