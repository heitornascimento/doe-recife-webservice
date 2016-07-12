class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.integer :codigo
      t.string :cnpj
      t.string :rd
      t.string :cidade
      t.string :razao_social
      t.string :donation_preference
      t.string :fone
      t.string :fax
      t.string :email
      t.integer :latitude
      t.integer :longitude

      t.timestamps
    end
  end
end
