class ChangeCloumnsNotnullAddRooms < ActiveRecord::Migration[6.0]
  def change
    change_column :rooms, :room_image, :string, null: false
  end
end
