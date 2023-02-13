class ChangeColumnToNull < ActiveRecord::Migration[6.0]
  def up
    change_column_null :reservations, :price, true
  end
  def down
    change_column_null :reservations, :price, false
  end
end
