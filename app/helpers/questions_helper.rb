module QuestionsHelper

  def question_sidebar(title, questions )
      arr = []
      questions.each do |question|
        arr << "<li>#{link_to question.title, question_path(question) }</li>"
      end
      content_tag :aside, :class=> :widget do
        [
          "<h3> #{title} </h3>",
          "<ul>",
          arr,
          "</ul>",
          ].join(' ').html_safe
      end
  end

end
