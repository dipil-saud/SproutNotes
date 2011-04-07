class Question < ActiveRecord::Base

  belongs_to :user
  belongs_to :category

  validates_presence_of :user,:category,:title, :description
  validates_uniqueness_of :title

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

