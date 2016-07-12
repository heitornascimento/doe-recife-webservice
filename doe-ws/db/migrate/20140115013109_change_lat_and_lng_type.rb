class ChangeLatAndLngType < ActiveRecord::Migration
  def up
    change_table :institutions do |t|
         t.change :latitude, :decimal
         t.change :longitude, :decimal
       end
  end

  def down
  end
end

