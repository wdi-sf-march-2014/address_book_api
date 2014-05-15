class EmailController < ApplicationController
  respond_to :json

  def about
  end

  def email
    @subject = params[:email][:subject]
    @body = params[:email][:body]
    @address = params[:contact]
    SiteMailer.person_email(@address, @subject, @body).deliver
    redirect_to root_path
  end
end
