class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments, dependent: :destroy
  delegate :name, :study, :purpose, :image, to: :profile
  
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship",  dependent: :destroy
  has_many :following, through: :following_relationships
  has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  
  def following?(user)
    following_relationships.find_by(following_id: user.id)
  end

  def follow(user)
    following_relationships.create!(following_id: user.id)
  end

  def unfollow(user)
    following_relationships.find_by(following_id: user.id).destroy
  end

  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

end
