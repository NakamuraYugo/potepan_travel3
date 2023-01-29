class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.string :address, null: false
      t.string :room_image
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
