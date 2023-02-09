class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :password, format: { with: /\A(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d)[a-z\dA-Z]{8,128}+\z/ , message: "は大文字小文字の英数字を含む必要があります。" }, on: :create
  validates :password, presence: true, on: :update
  validates :email, presence: true, on: :update

  has_many :rooms, dependent: :destroy
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, uniqueness: true, presence: true
  
end
