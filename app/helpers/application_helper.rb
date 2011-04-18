module ApplicationHelper

  def coderay(text)
      text.gsub(/\<code( lang="(.+?)")?\>(.+?)\<\/code\>/m) do
        CodeRay.scan($3, $2).div(:css => :class)
      end
  end

  def formatted_time(time)
    time.localtime.strftime("On %m/%d/%Y  at %I:%M%p")
  end

end
