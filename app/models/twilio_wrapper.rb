class TwilioWrapper
	attr_accessor :client, :from
	
	def initialize
		@client = Twilio::REST::Client.new(ENV["AUTH"], ENV["SID"])
		@from =  MY_APP_TEL
	end

	def recipient

	end

	def sms
		#Fix pseudocode in interpolation
		client.account.messages.create(:from => from, :to => User.last.phone_number, :body => Time.now)
	end
end
