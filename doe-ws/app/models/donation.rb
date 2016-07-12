class Donation < ActiveRecord::Base
  attr_accessible :donation_date, :donation_description, :institution_id, :user_id
  
  belongs_to :user, :foreign_key => "user_id"
  belongs_to :institution, :foreign_key => "institution_id"
  
end
