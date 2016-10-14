class FixClientAndOrganizationColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :sales, :id_campaign, :campaign_id
    rename_column :clients, :campaign, :campaign_id
  end
end
