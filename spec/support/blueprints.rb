require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end
User.blueprint do
  email { "abhay@thapa.com" }
  password { "123456" }
  password_confirmation { "123456" }
end

HowTo.blueprint do
  user
  category
  title { "How To Test" }
  description { "Description of how to" }
  difficulty { "Hard" }
  instructions { "1. Step 1"}
  likes { 0 }
end

Comment.blueprint do
  how_to
  user
  message { "Comment" }
end

Category.blueprint do
  name { "Test Category" }
end


Question.blueprint do
  user
  category
  title {"Querying my first problem"}
  description {"Can u solve it?"}

end
