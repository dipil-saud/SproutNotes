module CommentsHelper

  def display_comment(comment)
    content_tag :div, :class => :comment_box do
      [
        "<p>#{comment.message}</p>",
        "By <h5>#{current_user.email}</h5>",
        "<p>#{comment.created_at}</p>",
        ].join(' ').html_safe
    end
  end

end
