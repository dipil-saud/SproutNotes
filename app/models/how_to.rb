class HowTo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments

  validates :title, :presence => true
  validates :description, :presence => true
  validates :instructions, :presence => true
  validates :category, :presence => true

  before_create :zero_likes

  private

  def zero_likes
    self.likes = 0
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

