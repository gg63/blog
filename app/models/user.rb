class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end
  
  has_many :comments, dependent: :destroy
  delegate :name, :study, :purpose, :image, to: :profile
  
  has_many :following_relationships,foreign_key: "follower_id", class_name: "FollowRelationship",  dependent: :destroy
  has_many :followings, through: :following_relationships
  has_many :follower_relationships,foreign_key: "following_id",class_name: "FollowRelationship", dependent: :destroy
  has_many :followers, through: :follower_relationships
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  def follow(other_user)
    self.following_relationships.create(following_id: other_user.id)
  end
  
  def unfollow(other_user)
    self.following_relationships.find_by(following_id: other_user.id).destroy
  end
end