# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


task :sms do 
client = Twilio::REST::Client.new( "AC58325f3e89c734a36183bc7794e6431f" , "2307697510eb9aa980e524130d7538de")

@sms=client.account.messages.create(:from => "3479349187", :to => "9174509368", :body => "jithub")
@sms.sid
end
