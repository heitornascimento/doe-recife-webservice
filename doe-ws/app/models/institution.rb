class Institution < ActiveRecord::Base
  attr_accessible :cidade, :cnpj, :codigo, :donation_preference, :email, :fax, :fone, :latitude, 
  :longitude, :razao_social, :rd, :address
  
  has_many :donations
  
  
  
end