class Question < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :comments, :as => :commentable, :dependent => :destroy

  validates_presence_of :user,:title, :description
  validates_uniqueness_of :title

  attr_accessible :title, :description, :category, :new_category, :screenshot

  mount_uploader :screenshot, ImageUploader

  before_save :create_new_category
  attr_accessor :new_category

  def self.order_by(attribute, option)
    order("#{attribute} #{option}")
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
    end
  end

  def new_category
    return @new_category if @new_category
    return self.category.name if self.category
  end

  def create_new_category
    if self.new_category
      category = Category.find_or_create_by_name(self.new_category)
      self.category = category
      return true
    else
      puts self.new_category
      self.errors.add(:new_category, "Category Must Be Present")
      return false
    end
  end

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

