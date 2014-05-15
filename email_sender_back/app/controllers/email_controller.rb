class EmailController < ApplicationController

  def about
  end

  def email
  	# binding.pry
    # TODO: send the email here.
    SiteMailer.email(contact).deliver  
  end
end
