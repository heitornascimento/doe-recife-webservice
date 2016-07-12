class AddAddressToInstitutions < ActiveRecord::Migration
  def change
    add_column :institutions, :address, :string
  end
end
