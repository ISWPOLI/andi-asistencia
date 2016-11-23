class ChangeCampaignIdType < ActiveRecord::Migration[5.0]
  def change
    remove_column :clients, :campaign_id
    add_column :clients, :campaign_id, :integer
  end
end
