require 'spec_helper'

describe HowTo do
  it { should have_many(:comments).dependent(:destroy) }
  it {should belong_to :user}
  it {should belong_to :category}

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :instructions }

  context "When a HowTo is Created" do
    it "Should have 0 number of likes when created" do
      how_to = HowTo.make({:likes => 5})
      how_to.save
      HowTo.first.likes.should == 0
    end

    it "Should have by default 'medium' difficulty if not specified" do
      how_to = HowTo.make({:difficulty => nil })
      how_to.save
      HowTo.first.difficulty.should == "Medium"
    end
  end

  context "Attributes mass assignment" do

    it "Should not allow user_id to be assigned" do
     how_to = HowTo.make
     how_to.save
     user = how_to.user
     HowTo.first.update_attributes(:user_id => 9999, :title => "New Title")
     HowTo.first.title.should == "New Title"
     HowTo.first.user_id.should_not == 9999
     HowTo.first.user_id.should == user.id
    end

  end
end

# == Schema Information
#
# Table name: how_tos
#
#  id           :integer         not null, primary key
#  title        :string(255)
#  description  :text
#  difficulty   :string(255)
#  instructions :text
#  likes        :integer
#  category_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#

