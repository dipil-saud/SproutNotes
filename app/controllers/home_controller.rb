class HomeController < ApplicationController
  def index
  end

  def user
    @user = current_user
    @how_tos = current_user.how_tos
    @questions = current_user.questions
  end

end
