class SiteMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']

  def person_email(address, subject, body)
    @address = address
    @subject = subject
    @body = body
    mail(to: address, subject: subject, body: body)
  end
end
