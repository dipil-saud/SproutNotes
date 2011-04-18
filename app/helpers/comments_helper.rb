module CommentsHelper

  def display_comment(comment)
    content_tag :div, :class => :comment_box do
      [
        "#{link_to(comment.user.name, user_root_path(comment.user), :class => 'author')}",
        "<span class = 'date'>On #{comment.created_at}</span>",
        "<p>#{simple_format(comment.message)}</p>",
        comment_destroy_link(comment),
        ].join(' ').html_safe
    end
  end

  def comment_destroy_link( comment )
     if comment.user == current_user || comment.commentable.user == current_user
      if comment.commentable_type == "HowTo"
         link_to("Delete", how_to_comment_path(comment.commentable, comment), :method => :delete, :confirm => "Are You Sure???", :class => 'delete')
      elsif comment.commentable_type == "Question"
         link_to("Delete", question_comment_path(comment.commentable, comment), :method => :delete, :confirm => "Are You Sure???", :class => 'delete')
      end
     end
  end

end
