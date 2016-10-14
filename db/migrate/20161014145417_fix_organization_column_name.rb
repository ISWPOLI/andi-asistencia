class FixOrganizationColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :sales, :id_organization, :id_campaign
  end
end
