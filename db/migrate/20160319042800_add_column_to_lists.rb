

class AddColumnToLists < ActiveRecord::Migration
  def change 
    add_column :lists, :company, :string
    add_column :lists, :favourite_pokemon, :string
    
  end
end

