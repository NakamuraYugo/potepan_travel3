class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  validates :password, presence: true, on: :create #onオプションでcreateアクションのみでバリデーションが発動するようになる。
  validates :email, presence: true

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy
  mount_uploader :user_image, UserImageUploader

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, presence: true
  
end
