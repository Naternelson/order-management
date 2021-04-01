class CreateOrganizationUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :organization_users do |t|
      t.integer :organization_id
      t.integer :user_id
      t.string :role

      t.timestamps
    end
  end
end
