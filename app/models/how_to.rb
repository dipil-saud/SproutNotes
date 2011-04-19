class HowTo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, :as => :commentable, :dependent => :destroy

  validates :title, :presence => true
  validates :description, :presence => true
  validates :instructions, :presence => true

  attr_accessible :title, :description, :instructions, :new_category, :difficulty, :category, :screenshot
  mount_uploader :screenshot, ImageUploader


  before_create :zero_likes
  before_save :default_difficulty, :create_new_category
  after_initialize :default_difficulty

  attr_accessor :new_category

  scope :popular, order('likes DESC')


  def new_category
    return @new_category if @new_category
    return self.category.name if self.category
  end

  def self.order_by(attribute, option)
    order("#{attribute} #{option}")
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    end
  end

  def zero_likes
    self.likes = 0
  end

  def default_difficulty
    if self.difficulty == nil
      self.difficulty = "Medium"
    end
  end

  def create_new_category
    if self.new_category
      category = Category.find_or_create_by_name(self.new_category)
      self.category = category
      return true
    else
      self.errors.add(:new_category, "Category Must Be Present")
      return false
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

