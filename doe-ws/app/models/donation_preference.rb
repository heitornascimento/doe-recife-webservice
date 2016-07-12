class DonationPreference < ActiveRecord::Base
  attr_accessible :material_de_limpeza, :remedio, :cesta_basica, :material_pedagogico, :material_de_higiene_pessoal, 
  :brinquedos, :toalha_de_banho, :toalha_de_mesa, :recursos_financeiros, :outros
end
