class EmailWorker
  include Sidekiq::Worker

  def perform(email, subject, body)
    EmailMailer.email_template(email, subject, body).deliver
  end

end