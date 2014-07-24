class Alert < ActiveRecord::Base
  belongs_to :recipient  
  has_many :services
  	#make variable/method Service.find_by(name: self.service_name).traffic


	def bad_service?
		Service.find_by(name: self.service_name).traffic != "GOOD SERVICE"
	end

	def current_train_status
		Service.find_by(name: self.service_name).traffic
	end

	def changed_service?
		(self.last_alert_status != nil) && (self.last_alert_status != self.current_train_status)
	end

	def new_bad_service?
		self.bad_service? && self.last_alert_status != self.current_train_status
	end

	#checks if alert object is selected within critical timeframe of recipient
	def relevant_time?
		self.start < Time.now && self.end >Time.now 
	end

	def assign_value_of_changed_status
		self.update_attributes(last_alert_status: Service.find_by(name: self.service_name).traffic)
	end

	def reset_last_sent
		if Time.now -alert.last > 0
		alert.update_attributes(sent_at: nil, last_alert_status: nil) 
	end
	end

	def transmogrify
		assign_value_of_changed_status
		update_attributes(last_sent: Time.now)
			
		

	end


	

end