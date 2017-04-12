class Follower < ApplicationRecord
  validates :user_id,     presence: true, length: { maximum: 11 }
  validates :follower_id, presence: true, length: { maximum: 11 }

  belongs_to :follower_user, class_name: 'User', foreign_key: 'user_id' 
  belongs_to :followee_user, class_name: 'User', foreign_key: 'follower_id'
end
