class AddStartAndEndDateToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :start_date, :date
    add_column :payments, :end_date, :date
  end
end
