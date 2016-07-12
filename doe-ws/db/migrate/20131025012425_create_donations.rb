class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :user_id
      t.integer :institution_id
      t.datetime :donation_date
      t.string :donation_description

      t.timestamps
    end
  end
end
