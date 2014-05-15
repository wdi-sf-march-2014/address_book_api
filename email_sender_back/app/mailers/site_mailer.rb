class SiteMailer < ActionMailer::Base
  default from: "from@example.com"
  # from: the @contact email address
  def email(contact)
    @contact = contact
    mail(to: @contact.email)
  end

end