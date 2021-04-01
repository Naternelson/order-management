class RenameCasesToBoxes < ActiveRecord::Migration[6.1]
  def change 
    add_column :cases, :name, :string
    rename_table :cases, :boxes
  end
end
