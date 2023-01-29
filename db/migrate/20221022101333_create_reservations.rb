class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.datetime :start_date, null: false
      t.datetime :end_date,null: false
      t.integer :number_people, null: false

      t.timestamps
    end
  end
end
