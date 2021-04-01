class CreateBays < ActiveRecord::Migration[6.1]
  def change
    create_table :bays do |t|
      t.string :alias
      t.string :name
      t.integer :column_id

      t.timestamps
    end
  end
end
