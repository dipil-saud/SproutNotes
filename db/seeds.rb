# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'ffaker'

[
  { :name => "Rspec" },
  { :name => "Rails" },
  { :name => "Testing" },
  { :name => "Haml" },
  { :name => "Plain Ruby1" },
  { :name => "Plain Ruby2" },
  { :name => "Plain Ruby3" },
  { :name => "Plain Ruby4" },
  { :name => "Plain Ruby5" }
].each do |attribute|
    Category.find_or_create_by_name(attribute)
end
ruby_code = '<code lang="ruby">
def hello
  puts "Hello, world!"
end
</code>'
html_code =  '<code lang="html">
  <h1>Header</h1>
  <p>Test HTml Paragraph</p>
</code>'
user =  User.find_or_create_by_email(:email =>"a@a.com", :password =>"123456", :password_confirmation =>"123456" )
 (0..4).each do |y|
   user.how_tos.create(:title => Faker::Company.bs.capitalize ,
                       :description =>Faker::Lorem.paragraph(sentence_count =5),
                       :difficulty =>"Hard",
                       :instructions =>Faker::Lorem.paragraphs(paragraph_count = 5).join("\n")+ruby_code,
                       :category_id =>Category.all[y].id,
                       :new_category => "Rails" )
   user.how_tos.create(:title => Faker::Company.bs.capitalize ,
                       :description =>Faker::Lorem.paragraph(sentence_count =5),
                       :difficulty =>"Hard",
                       :instructions =>Faker::Lorem.paragraphs(paragraph_count = 5).join("\n")+html_code,
                       :category_id =>Category.all[y].id,
                       :new_category => "Rspec" )
   user.questions.create(:title => Faker::Company.bs.capitalize ,
                         :description =>Faker::Lorem.paragraphs(paragraph_count = 2).join("\n"),
                         :category_id =>Category.all[y].id,
                         :new_category => "Rspec")
 end

(1..5).each do |x|
  user =  User.create(:name => Faker::Name.name, :email =>Faker::Internet.email, :password =>"123456", :password_confirmation =>"123456" )
  (0..4).each do |y|
    user.how_tos.create(:title => Faker::Company.bs.capitalize ,
                        :description =>Faker::Lorem.paragraph(sentence_count =5),
                        :difficulty =>"Hard",
                        :instructions =>Faker::Lorem.paragraphs(paragraph_count = 5).join("\n")+ruby_code,
                        :category_id =>Category.all[y].id,
                        :new_category => "Rspec")

    user.questions.create(:title => Faker::Company.bs.capitalize,
                          :description =>Faker::Lorem.paragraphs(paragraph_count = 2).join("\n"),
                          :category_id =>Category.all[y].id,
                          :new_category => "Rspec")
  end
end
