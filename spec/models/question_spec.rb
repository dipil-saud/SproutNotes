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

