class Question < ActiveRecord::Base

  belongs_to :user
  belongs_to :category
  has_many :comments, :as => :commentable, :dependent => :destroy

  validates_presence_of :user,:category,:title, :description
  validates_uniqueness_of :title

  attr_accessible :title, :description, :category_id

  def self.order_by(attribute, option)
    order("#{attribute} #{option}")
  end

  def self.search(search)
    if search
      where('title LIKE ?', "%#{search}%")
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

