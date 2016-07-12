class CreateDonationPreferences < ActiveRecord::Migration
  def change
    create_table :donation_preferences do |t|
      t.string :material_de_limpeza
      t.string :remedio
      t.string :cesta_basica
      t.string :material_pedagogico
      t.string :material_de_higiene_pessoal
      t.string :brinquedos
      t.string :toalha_de_banho
      t.string :toalha_de_mesa
      t.string :recursos_financeiros
      t.string :outros

      t.timestamps
    end
    
    
    DonationPreference.create :material_de_limpeza => "material de limpeza",
                         :remedio => "remedio",
                         :cesta_basica => "cesta basica",
                         :material_pedagogico => "material pedagogico",
                         :material_de_higiene_pessoal => "material de higiene pessoal",
                         :brinquedos => "brinquedos",
                         :toalha_de_banho => "toalha de banho",
                         :toalha_de_mesa => "toalha de mesa",
                         :recursos_financeiros => "recursos financeiros",
                         :outros => "outros"
    
  end
end
