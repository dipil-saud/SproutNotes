class UserMailer < ActionMailer::Base
  default :from => "sprout.notes@sprout-technology.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.Welcome.subject
  #
  def commented (commentable, comment, email)
      @commentable = commentable
      @comment = comment
      mail :to => email,
           :subject =>"#{@commentable.class} \"#{@commentable.title}\" has been commented"
  end

end
