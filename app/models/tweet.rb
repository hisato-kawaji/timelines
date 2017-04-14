class Tweet < ApplicationRecord
  validates :user_id, presence: true, length: { maximum: 11 }
  validates :tweet,   presence: true, length: { maximum: 256 }

  belongs_to :user, foreign_key: :user_id

  #scope :get_followers_tweets, ->(user_id) { where_not user_id: user_id }
end
