class CreateZones < ActiveRecord::Migration[6.1]
  def change
    create_table :zones do |t|
      t.string :name
      t.string :alias
      t.integer :site_id

      t.timestamps
    end
  end
end
