class AddSaleDateToSale < ActiveRecord::Migration[5.0]
  def change
    add_column :sales, :sale_date, :date
  end
end
