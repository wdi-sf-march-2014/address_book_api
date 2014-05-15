class EmailMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']

  def email(email)
  	@to = email["to"]
  	@subject = email["subject"]
  	@message = email["message"]
    mail(to: @to, subject: @subject)
  end

end
