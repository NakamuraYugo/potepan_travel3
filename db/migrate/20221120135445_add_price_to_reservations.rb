class AddPriceToReservations < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :price, :integer, null: false
  end
end
