class DropOrganization < ActiveRecord::Migration[5.0]
  def change
    drop_table :organizations
  end
end
