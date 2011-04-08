module HowTosHelper

  def display_how_to(how_to)
    content_tag :article, :class => :how_to do
      [
        "<h2>#{link_to how_to.title, how_to_path(how_to)}</h2>",
        edit_links(how_to),
        "<span class = 'author'>By #{link_to(how_to.user.email, user_show_path(how_to.user))}</span>",
        "<span class = 'date'>On #{how_to.created_at.to_date}</span>",
        "<span class = 'likes'>Liked By <span class = 'no_of_likes'>#{how_to.likes}</span>",
        "| #{link_to("Like", how_to_like_path(how_to), :remote => true) if !session[how_to.id] && how_to.user != current_user && user_signed_in? }</span>",
        "<p class = 'description'>#{how_to.description}</p>",
        "<span class = 'author'>Difficulty: #{how_to.difficulty}</span>",
        "<span class = 'date'>Category: #{how_to.category.name}</span>",
        "<div class = 'instructions'>#{simple_format(coderay(how_to.instructions))}</div>",
        ].join(' ').html_safe
    end
  end

  def edit_links ( how_to )
    if how_to.user == current_user
      [
        link_to("Edit", edit_how_to_path(how_to) ),
        link_to("Delete", how_to_path(how_to), :method => :delete, :confirm => "Are You Sure???" ),
      ]
    end
  end

  def how_to_sidebar(how_tos)
      arr = []
      how_tos.each do |how_to|
        arr << "<li>#{link_to how_to.title, how_to_path(how_to) }</li>"
      end
      content_tag :aside, :class=> :widget do
        [
          "<h3> Related </h3>",
          "<ul>",
          arr,
          "</ul>",
          ].join(' ').html_safe
      end
  end


end
