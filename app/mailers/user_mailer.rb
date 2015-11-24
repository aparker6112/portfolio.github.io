class UserMailer < ApplicationMailer
	default from: "adam3692@hotmail.co.uk"

	def signup_confirmation(user)
		@user = user

		mail to: user.email, subject: "Sign up confirmation"
	end
end
