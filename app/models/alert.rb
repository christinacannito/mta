class Alert < ActiveRecord::Base
  belongs_to :recipient  
  has_many :services
  	#make variable/method Service.find_by(name: self.service_name).traffic

	def bad_service?
		Service.find_by(name: self.service_name).traffic =! "GOOD SERVICE"
	end

	def self.current_train_status
		Service.find_by(name: self.service_name).traffic
	end

	#checks if alert object is selected within critical timeframe of recipient
	def relevant_time?
		self.start < Time.now && self.end >Time.now 
	end

	def assign_value_of_changed_status
		self.update_attribute(last_alert_status: Service.find_by(name: self.service_name).traffic)
	end

	def reset_last_sent
		if Time.now -self.last > 0
		self.update_attributes(sent_at: nil, last_alert_status: nil) 
	end

	def transmogrify
		self.assign_value_of_changed_status
		self.update_attributes(last_sent: Time.now)
			
		

	end


	

end