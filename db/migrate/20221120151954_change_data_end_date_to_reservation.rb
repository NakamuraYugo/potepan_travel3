class ChangeDataEndDateToReservation < ActiveRecord::Migration[6.0]
  def change
    change_column :reservations, :end_date, :date
  end
end
