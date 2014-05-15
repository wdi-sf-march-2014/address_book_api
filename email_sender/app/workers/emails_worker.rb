class EmailsWorker
	include Sidekiq::Worker

	def perform(email_params)
		email = email_params
		EmailMailer.email(email).deliver
	end

end
