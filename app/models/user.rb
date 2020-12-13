class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  has_one :profile, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes
  has_many :comments
  delegate :name, :study, :purpose, :image, to: :profile
  
  def liked_by?(post_id)
    likes.where(post_id: post_id).exists?
  end

end
