class AddSlugToOrganization < ActiveRecord::Migration[6.1]
  def change
    add_column :organizations, :slug, :string
  end
end
