class RenameTypeToOrgTypeInOrganizations < ActiveRecord::Migration[6.1]
  def change
    rename_column :organizations, :type, :org_type
  end
end
