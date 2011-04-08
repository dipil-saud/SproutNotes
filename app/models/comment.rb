class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  validates :message, :presence => true
  validates :user, :presence => true

  attr_accessible :message, :user

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

