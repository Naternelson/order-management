class CreateAilses < ActiveRecord::Migration[6.1]
  def change
    create_table :ailses do |t|
      t.string :alias
      t.string :name
      t.integer :zone_id

      t.timestamps
    end
  end
end
