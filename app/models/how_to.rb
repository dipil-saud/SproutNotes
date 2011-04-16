class HowTo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, :as => :commentable, :dependent => :destroy

  validates :title, :presence => true
  validates :description, :presence => true
  validates :instructions, :presence => true

  validates :new_category, :presence => true

  attr_accessible :title, :description, :instructions, :new_category, :difficulty, :category

  before_create :zero_likes, :create_new_category
  before_save :default_difficulty
  after_initialize :default_difficulty

  attr_accessor :new_category

  def self.order_by(attribute, option)
    order("#{attribute} #{option}")
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    end
  end

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
    return true if self.category
    category = Category.find_or_create_by_name(self.new_category)
    self.category = category
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

