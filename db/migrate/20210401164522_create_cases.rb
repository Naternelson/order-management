class CreateCases < ActiveRecord::Migration[6.1]
  def change
    create_table :cases do |t|
      t.integer :batch_id
      t.integer :max_size
      t.integer :min_size
      t.string :status
      t.integer :amount
      t.integer :bay_id
      t.string :alias

      t.timestamps
    end
  end
end
