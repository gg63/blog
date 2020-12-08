class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  # has_many :profiles, dependent: :destroy
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :like_tweets, through: :likes, source: :tweet
  
  delegate :name, :study, :purpose, :image, to: :profile
end
