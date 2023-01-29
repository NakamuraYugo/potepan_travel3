class ChangeDataStartDateToReservation < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :start_date, :date
  end
end
