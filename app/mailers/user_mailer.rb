class UserMailer < ActionMailer::Base
  default from: "onloanapp@gmail.com"

  def send_message(user, message)
  	@message =message
  	@user = user
  	mail(to: user.email, subject: "You have a new message on onLoan!") do |format|
  		format.text
  	end
  end
end
