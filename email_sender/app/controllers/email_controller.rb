class EmailController < ApplicationController

respond_to :json

  def about
  end

  def email
  	EmailMailer.email(email_params).deliver
		render json: "sending"
  end

private
  def email_params
    params.require(:email).permit(:contact_id, :to, :subject, :message)
  end
end
