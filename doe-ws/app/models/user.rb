class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable, :confirmable, , :validatable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, 
          :token_authenticatable
         
         #removi validatable DO DEVISE - nao sei as implicações disso

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :donation_preference
  
  before_save :ensure_authentication_token
  
  #def skip_confirmation!
   # self.confirmed_at = Time.now
  #end
  
  def donation_count
  return self.donations.count 
  end
  
  #try to get instituins for donations
  def get_institution_for_donation
      if self.donations.count > 0
      
      end
  end
  
  has_many :donations, :dependent => :destroy 
  has_many :institutions, :through => :donations
  
  # attr_accessible :title, :body
end
