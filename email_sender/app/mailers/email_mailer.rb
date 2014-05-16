class EmailMailer < ActionMailer::Base
  default from: ENV['EMAIL_FROM_ADDRESS']


  ## A mailer doesn't need a view if you specifiy the body as well.
  ## See the rails guide:
  ## http://guides.rubyonrails.org/action_mailer_basics.html#sending-emails-without-template-rendering
  def email_template(to, subject, body)
    mail(to: to, subject: subject, body: body, content_type: "text/html")
  end
end
