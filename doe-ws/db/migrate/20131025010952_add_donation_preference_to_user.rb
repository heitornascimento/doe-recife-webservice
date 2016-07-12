class AddDonationPreferenceToUser < ActiveRecord::Migration
  def change
    add_column :users, :donation_preference, :string
  end
end
