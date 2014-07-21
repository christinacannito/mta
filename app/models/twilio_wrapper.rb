class TwilioWrapper
	attr_accessor :client, :from
	
	def initialize
		@client = Twilio::REST::Client.new( "ACbf9655e5dce076f5f08146511db291ec" , "3e53b709f9ebab86ea4db344dc70fe99")
		@from = "6466814097" 
	end

	def all_train_status
		Service.all.each {|lines| "#{lines.traffic}"}
	end

	def sms
		#Fix pseudocode in interpolation
		client.account.messages.create(:from => from, :to => User.last.phone_number, :body => "Smart Alarm reminder from Yaritza")
	end
end