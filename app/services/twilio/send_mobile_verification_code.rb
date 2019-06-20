module  Twilio
	class SendMobileVerificationCode

		def initialize(phone_number, verification_code)
			@phone_number = phone_number
			@verification_code = verification_code
		end

		def call
			send_verification_code
		end

		private

		def send_verification_code
			client = Twilio::REST::Client.new(Rails.application.credentials.twilio[:account_sid] , Rails.application.credentials.twilio[:auth_token] )
			begin
				client.messages.create({
					from: "+13102998318",
					to: @phone_number,
					body: "Hi, Your verification code is: #{@verification_code}"
				})
			rescue Twilio::REST::RestError => e
				if e.code == 21211
					puts e.message
				end
			end
		end
	end
end