class User < ApplicationRecord
  
  has_secure_password
  validates :email, presence: true, uniqueness: true
  
  has_many :profiles
  # has_one :profile, dependent: :destroy
end
