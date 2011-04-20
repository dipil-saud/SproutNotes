class Category < ActiveRecord::Base
  has_many :how_tos, :dependent => :nullify
  has_many :questions, :dependent => :nullify

  validates :name, :presence => true, :uniqueness => true
  attr_accessible :name

  default_scope order('LOWER(name) ASC')
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

