class Post < ApplicationRecord
    has_many_attached :images, dependent: :destroy
    has_many :likes
    belongs_to :user
    has_many :comments, dependent: :destroy
end
