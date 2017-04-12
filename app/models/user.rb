class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :tweet
  has_many :followers, class_name: 'Follower', foreign_key: 'user_id', dependent: :destroy
  has_many :followees, class_name: 'Follower', foreign_key: 'follower_id', dependent: :destroy
  has_many :follower_users, through: :followers, source: 'followee_user'
  has_many :followee_users, through: :followees, source: 'follower_user'

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true,
    format:     { with: VALID_EMAIL_REGEX },
    uniqueness: { case_sensitive: false },
    on:         :devise,
    unless:     proc { |a| a.email.blank? }
  validates :name, presence: true, length: { maximum: 32 }, on: :devise

  scope :get_others, ->(user_id) { where_not id: user_id }
end
