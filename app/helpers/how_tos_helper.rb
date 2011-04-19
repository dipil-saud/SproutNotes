module HowTosHelper

  def edit_links ( how_to )
    if how_to.user == current_user
      [
        link_to("Delete", how_to_path(how_to), :method => :delete, :confirm => "Are You Sure???" ),
        link_to("Edit", edit_how_to_path(how_to) ),
      ].join(' ').html_safe
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
