require 'spec_helper'

describe Comment do
  it { should belong_to :user }
  it { should belong_to :commentable }

  it { should validate_presence_of :message }
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  how_to_id  :integer
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#

