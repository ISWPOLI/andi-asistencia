class AddCampaignAndAddressToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :campaign, :string
    add_column :clients, :address, :string
  end
end
