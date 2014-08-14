# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rarequire File.expand_path('../config/application', __FILE__)
require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks

task :email => :environment do
	Alert.all.each do |alert|
		if alert.changed_service?
			ConfirmationMailer.confirmation_email(alert, User.find(alert.recipient.user_id).email).deliver
		elsif alert.new_bad_service?
			ConfirmationMailer.confirmation_email(alert,alert.email).deliver
			#ConfirmationMailer.confirmation_email(alert,User.find(alert.recipient.user_id).email).deliver			
		end	
	end	
end




task :text_each_alert => :environment do
		Alert.all.each do |alert|

			 if alert.changed_service?
			 	text=TwilioWrapper.new(alert.id)

			 	#Text or call
				text.sms if Alert.sms == "sms" 
				text.call if Alert.sms == "call"
				
				alert.transmogrify
				
			 	


			 elsif alert.new_bad_service?

				text=TwilioWrapper.new(alert.id)
				#Text or call
				text.sms if Alert.sms == "sms" 
				text.call if Alert.sms == "call"
			
				alert.transmogrify	

				

		end
	end
end




