class Post < ApplicationRecord
    has_many_attached :images, dependent: :destroy
    has_many :likes, dependent: :destroy
    belongs_to :user
    
    # def liked?(user)
    #     likes.where(user_id: user.id).exists?
    # end
end
