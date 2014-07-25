# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rarequire File.expand_path('../config/application', __FILE__)
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks



task :text_each_alert => :environment do
		Alert.all.each do |alert|

		# if alert.relevant_time?	
			
			 if alert.changed_service?
			 	text=TwilioWrapper.new(alert.id)
				text.sms
				alert.transmogrify
				
			 	


			 elsif alert.new_bad_service?

				text=TwilioWrapper.new(alert.id)
				text.sms
			
				alert.transmogrify
				

			end	
		end
	#end
end



