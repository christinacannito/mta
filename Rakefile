# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rarequire File.expand_path('../config/application', __FILE__)
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks



task :text_each_alert => :environment do
		Alert.all.each do |alert|
	
			
			
			if alert.relevant_time?
			 if alert.changed_service?
			 	
				text=TwilioWrapper.new(alert.id)
			 	puts "alert object created for changed service"
			 	puts text.sms
			 	puts "triggered text to #{text.recipient_number}"

			 	#Text or call
				# text.sms if Alert.sms == "sms" 
				# text.call if Alert.sms == "call"
				
				alert.transmogrify
				
			 	


			 elsif alert.new_bad_service?

				text=TwilioWrapper.new(alert.id)
				# binding.pry
				puts "alert object created for new bad service"
				text.sms
				puts "triggered text to #{text.recipient_number}"
				#Text or call
				# text.sms if Alert.sms == "sms" 
				# text.call if Alert.sms == "call"
			
				alert.transmogrify	
			end
			end	
		end	
end




