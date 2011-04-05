class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :how_to

  validates :message, :presence => true
  validates :user, :presence => true
  validates :how_to, :presence => true


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

