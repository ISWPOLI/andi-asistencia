class AddRequiredToCampaignId < ActiveRecord::Migration[5.0]
  def change
    change_column :clients, :campaign_id, :integer, :null => false
  end
end
