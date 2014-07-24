class TwilioWrapper
	attr_accessor :client, :from
	
	def initialize
		@client = Twilio::REST::Client.new(ENV["SID"], ENV["AUTH"])
		@from =  MY_APP_TEL
	end

	def recipient_number
		Alert.find_by(@alert_id).recipient.phone_number
	end 
 
	def train_status
		name=Service.find_by(name: Alert.find_by(@alert_id).service_name).name
		traffic=Service.find_by(name: Alert.find_by(@alert_id).service_name).traffic
		"Status for #{name} is #{traffic}"
	end
 
	def sms
		client.account.messages.create(:from => from, :to => recipient_number, :body => train_status)
	end

end