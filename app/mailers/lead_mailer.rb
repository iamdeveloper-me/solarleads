class LeadMailer < ApplicationMailer
	default from: 'notifications@example.com'
	
	def thankyou_email(lead)
		@lead = lead.email
		@url  = 'http://localhost:3000'
		mail(to: @lead, subject: 'Welcome to My Awesome Site')
	end

	def email_confirmation(email, confirmation_token)
		@email = email
		@confirmation_token = confirmation_token
		mail(:to => @email, :subject => "Email Confirmation")
	end
end