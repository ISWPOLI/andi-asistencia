class RenamePaymentIdSaleColumn < ActiveRecord::Migration[5.0]
  def change
    rename_column :payments, :id_sale, :sale_id
  end
end
