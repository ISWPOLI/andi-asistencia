class AddPaymentDateToPayment < ActiveRecord::Migration[5.0]
  def change
    add_column :payments, :payment_date, :date
  end
end
