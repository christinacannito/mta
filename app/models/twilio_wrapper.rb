class TwilioWrapper
	attr_accessor :client, :from
	
	def initialize
		@client = Twilio::REST::Client.new( "ACbf9655e5dce076f5f08146511db291ec" , "3e53b709f9ebab86ea4db344dc70fe99")
		@from = "6466814097" 
	end

		
	def recipient_number
		Alert.find_by(id: int).recipient_id.phone_number
		User.find(1).recipients.last.phone_number
	end

	

	def sms
		client.account.messages.create(:from => from, :to => recipient_number, :body => )
	end
end
