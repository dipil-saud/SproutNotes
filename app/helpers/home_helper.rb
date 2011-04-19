module HomeHelper

  def user_points(user)
    return 15 + user.how_tos.length*50 + user.questions.length*30 + user.comments.length*15
  end

  def display_name(user)
    if user == current_user
      "My"
    else
      user.name + "'s"
    end
  end

end
