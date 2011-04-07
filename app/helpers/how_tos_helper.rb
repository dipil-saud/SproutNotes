module HowTosHelper

  def display_how_to(how_to)
    content_tag :article, :class => :how_to do
      [
        "<h2>#{link_to how_to.title, how_to_path(how_to)}</h2>",
        edit_links(how_to),
        "<span class = 'author'>By #{how_to.user.email}</span>",
        "<span class = 'date'>On #{how_to.created_at.to_date}</span>",
        "<span class = 'likes'>Liked By #{how_to.likes}</span>",
        "<p class = 'description'>#{how_to.description}</p>",
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
