class CreateColumns < ActiveRecord::Migration[6.1]
  def change
    create_table :columns do |t|
      t.string :alias
      t.string :name
      t.integer :aisle_id

      t.timestamps
    end
  end
end
