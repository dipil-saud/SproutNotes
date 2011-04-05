require 'spec_helper'

describe Comment do

  before(:all) do

  end
  it { should belong_to :user }
  it { should belong_to :how_to }

  it { should validate_presence_of :message }
  it { should validate_presence_of :how_to }
  it { should validate_presence_of :user }

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

