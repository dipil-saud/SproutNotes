require 'spec_helper'

describe Question do
  it { should belong_to :category }
  it { should belong_to :user }
  it { should have_many(:comments).dependent(:destroy)}

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :category }
  it { should validate_presence_of :user }
  # it { should validate_uniqueness_of :title }

  context "Security in mass assignment" do

     it "Should not allow user_id to be assigned" do
      question = Question.make
      question.save
      user = question.user
      Question.first.update_attributes(:user_id => 9999, :title => "New Title")
      Question.first.title.should == "New Title"
      Question.first.user_id.should_not == 9999
      Question.first.user_id.should == user.id
     end

   end
end

# == Schema Information
#
# Table name: questions
#
#  id          :integer         not null, primary key
#  title       :string(255)
#  description :text
#  category_id :integer
#  user_id     :integer
#  created_at  :datetime
#  updated_at  :datetime
#

