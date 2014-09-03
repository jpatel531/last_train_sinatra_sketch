

class TwilioWorker

	
	attr_reader :sms_sender

	def initialize
		@sms_sender = Twilio::REST::Client.new("AC2ee3aaedbbcefa36241064e99199d80d", "417e9ad3fe91f49d24ebbedafee0562a")
	end

	def send(phone_number, instructions)
		sms_sender.account.messages.create(
			from: 441295477003, 
			to: phone_number,
			body: instructions
		)	
	end


end