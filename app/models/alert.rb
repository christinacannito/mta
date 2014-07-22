class Alert < ActiveRecord::Base

  belongs_to :user

  belongs_to :recipient  
  has_many :services

end
