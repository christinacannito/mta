class Alert < ActiveRecord::Base

  belongs_to :recipient  
  has_many :services

<<<<<<< HEAD


  
=======
	def kosher?
		Service.find_by(name: self.service_name).traffic =! "GOOD SERVICE"
	end

>>>>>>> 16ec67ea16f79742b2b24180946cdc919ee1d1ad
end

