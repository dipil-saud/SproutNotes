require 'spec_helper'

describe Category do
  before(:all) do
    category = Category.make
    category.save
  end
  it { should have_many :how_tos }
  it { should have_many :questions }

  it { should validate_presence_of :name }
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

