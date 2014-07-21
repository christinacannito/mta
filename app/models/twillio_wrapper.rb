class TwilioWrapper

	def initialize
		@client = Twilio::REST::Client.new( "AC58325f3e89c734a36183bc7794e6431f" , "2307697510eb9aa980e524130d7538de")
		@from = "3479349187" 

	end

	def client
		@client
	end

	def from
		@from
	end

	def all_train_status
		Service.all.collect {|lines| "#{lines.traffic}/n"}
	end

	def sms
		#Fix pseudocode in interpolation
		@sms = @client.account.messages.create(:from => @from, :to => current_user.phone_number, :body => "Smart Alarm reminder from Yaritza at #{current_user.id.phone_number}:/n Current train statuses: #{all_train_status}")
		@sms.sid
	end
	
	def call
		 

		
	end

end

@communication = TwilioWrapper.new
@comunnication.sms
