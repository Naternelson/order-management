class CreateSites < ActiveRecord::Migration[6.1]
  def change
    create_table :sites do |t|
      t.string :name
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state 
      t.string :zip
      t.string :type 
      t.string :alias

      t.timestamps
    end
  end
end
