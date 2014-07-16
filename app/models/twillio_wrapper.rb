class TwillioWrapper

	def initialize
		@client = Twilio::REST::Client.new( "AC58325f3e89c734a36183bc7794e6431f" , "2307697510eb9aa980e524130d7538de")
		@from = "3479349187" #User.id.phone_number
	end

	def client
		@client
	end

	def from
		@from
	end

	def sms
		#Fix pseudocode in interpolation
		@sms=client.account.messages.create(:from => @from, :to => "3476319490", :body => "#{Service.name.status}")
		@sms.sid
	end
	
	def call
		 

		
	end

end
