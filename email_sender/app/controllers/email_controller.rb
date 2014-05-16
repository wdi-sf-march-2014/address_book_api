class EmailController < ApplicationController

  def about
  end

  def email
    EmailWorker.perform_async(params[:email], params[:subject], params[:body])

    respond_to do |format|
      format.json { render json: nil, status: :ok}
    end
  end
end
