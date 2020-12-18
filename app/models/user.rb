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
  
  has_many :follows
  has_many :followings, through: :follows, source: :follow
  has_many :reverse_of_follows, class_name: 'Follow', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_follows, source: :user

  def follow(other_user)
    unless self == other_user
      self.follows.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    follow = self.relationships.find_by(follow_id: other_user.id)
    follow.destroy if follow
  end

  def following?(other_user)
    self.follow.include?(other_user)
  end

end
