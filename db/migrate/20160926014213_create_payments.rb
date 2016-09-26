class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :client_id
      t.integer :id_sale

      t.timestamps
    end
  end
end
