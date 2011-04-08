class HomeController < ApplicationController

  before_filter :authenticate_user! , :only => :user

  def index
  end

  def user
    @user = current_user
    @how_tos = current_user.how_tos
    @questions = current_user.questions
  end

end
