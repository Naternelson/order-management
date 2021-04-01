class AddOrganizationIdToSites < ActiveRecord::Migration[6.1]
  def change
    add_column :sites, :organization_id, :integer
  end
end
