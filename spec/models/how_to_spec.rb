require 'spec_helper'

describe HowTo do
  it { should have_many :comments }
  it {should belong_to :user}
  it {should belong_to :category}

  it { should validate_presence_of :title }
  it { should validate_presence_of :description }
  it { should validate_presence_of :instructions }
  it { should validate_presence_of :category }

  it "Should have 0 number of likes when created" do
    how_to = HowTo.make({:likes => 5})
    how_to.save
    HowTo.first.likes.should == 0
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

