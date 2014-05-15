class EmailController < ApplicationController
  respond_to :json

  def about
  end

  def email
    @subject = params[:email][:subject]
    @body = params[:email][:body]
    @address = params[:contact]
    EmailsWorker.perform_async(@address, @subject, @body)
    redirect_to root_path
  end
end
