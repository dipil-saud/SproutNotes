class HowTo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, :as => :commentable, :dependent => :destroy

  validates :title, :presence => true
  validates :description, :presence => true
  validates :instructions, :presence => true
  validates :category, :presence => true

  attr_accessible :title, :description, :instructions, :category_id, :new_category, :difficulty

  before_create :zero_likes
  before_save :default_difficulty, :create_new_category
  after_initialize :default_difficulty

  attr_accessor :new_category

  private

  def zero_likes
    self.likes = 0
  end

  def default_difficulty
    if self.difficulty == nil
      self.difficulty = "Medium"
    end
  end

  def create_new_category
    if self.new_category != nil
      category = Category.new(:name => self.new_category)
      self.category_id = category.id if category.save
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

