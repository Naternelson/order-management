class AddOrganizationIdToOrders < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :organization_id, :integer
  end
end
