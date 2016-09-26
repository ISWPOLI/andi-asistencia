class CreateSales < ActiveRecord::Migration[5.0]
  def change
    create_table :sales do |t|
      t.integer :client_id
      t.integer :id_organization
      t.float :amount
      t.string :card_number

      t.timestamps
    end
  end
end
