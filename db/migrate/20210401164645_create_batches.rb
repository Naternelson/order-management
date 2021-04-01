class CreateBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :batches do |t|
      t.string :alias
      t.string :batch_name
      t.integer :product_id
      t.datetime :mfg_date
      t.datetime :exp_date

      t.timestamps
    end
  end
end
