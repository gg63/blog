class Post < ApplicationRecord
    has_many_attached :images, dependent: :destroy
    has_many :likes, dependent: :destroy
    def like_user(user_id)
        likes.find_by(user_id: user_id)
    end
    belongs_to :user
    
end
