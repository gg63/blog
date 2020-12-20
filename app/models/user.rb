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

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'  
  end
end