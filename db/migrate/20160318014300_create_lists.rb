#require_relative '/config'

# this is where you should use an ActiveRecord migration to 

class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.string :phone
      t.string :address

      t.timestamps
    end
  end
end
