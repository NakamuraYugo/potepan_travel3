class Room < ApplicationRecord
  belongs_to :user
  mount_uploader :room_image, RoomImageUploader
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :introduction, presence: true, length: { maximum: 65_535 }

end
