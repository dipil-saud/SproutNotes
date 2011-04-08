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
  { :name => "Plain Ruby" }
].each do |attribute|
    Category.find_or_create_by_name(attribute)
end

 user =  User.find_or_create_by_email(:email =>"a@a.com", :password =>"123456", :password_confirmation =>"123456" )
 (0..4).each do |y|
   user.how_tos.create(:title => Faker::Company.bs.capitalize ,
                       :description =>Faker::Lorem.paragraph(sentence_count =5),
                       :difficulty =>"Hard",
                       :instructions =>Faker::Lorem.paragraphs(paragraph_count = 5).join("\n"),
                       :category_id =>Category.all[y].id )
   user.questions.create(:title => Faker::Company.bs.capitalize ,
                         :description =>Faker::Lorem.paragraphs(paragraph_count = 2).join("\n"),
                         :category_id =>Category.all[y].id)
 end

(1..5).each do |x|
  user =  User.create(:email =>Faker::Internet.email, :password =>"123456", :password_confirmation =>"123456" )
  (0..4).each do |y|
    user.how_tos.create(:title => Faker::Company.bs.capitalize ,
                        :description =>Faker::Lorem.paragraph(sentence_count =5),
                        :difficulty =>"Hard",
                        :instructions =>Faker::Lorem.paragraphs(paragraph_count = 5).join("\n"),
                        :category_id =>Category.all[y].id)

    user.questions.create(:title => Faker::Company.bs.capitalize,
                          :description =>Faker::Lorem.paragraphs(paragraph_count = 2).join("\n"),
                          :category_id =>Category.all[y].id)
  end
end