class CreateClients < ActiveRecord::Migration[5.0]
  def change
    create_table :clients do |t|
      t.string :first_name
      t.string :last_name
      t.string :document_number
      t.string :cellphone_number
      t.boolean :is_active
      t.string :city

      t.timestamps
    end
  end
end
