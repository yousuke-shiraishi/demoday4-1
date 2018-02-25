class Member < ApplicationRecord
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :email, uniqueness: true
  before_save { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 } ,on: :create
  validates :birth, presence: true
  has_many :gmaps
  mount_uploader :image, ImageUploader

end
