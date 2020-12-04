class Profile < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  
  validates :name, presence: true
  validates :study, presence: true
  validates :purpose, presence: true
end
