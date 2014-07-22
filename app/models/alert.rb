class Alert < ActiveRecord::Base

  belongs_to :recipient  
  has_many :services

	def kosher?
		Service.find_by(name: self.service_name).traffic =! "GOOD SERVICE"
	end

end
