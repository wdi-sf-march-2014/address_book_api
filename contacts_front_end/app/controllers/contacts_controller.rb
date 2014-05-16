class ContactsController < ApplicationController
  before_action :load_contact, only: [:show, :edit, :update, :destroy, :new_email, :sent_email]

  def index
    @contacts = current_user.contacts
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user_id = current_user.id
    if @contact.save
      redirect_to root_path
    else
      flash[:errors] = @contact.errors.full_messages
      render :new
    end
  end

  def edit
    
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact
    else
      flash[:errors] = @contact.errors.full_messages
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to root_path
  end

  def new_email
    # Should return a view that allows the user to create an email
  end

  def send_email
    response = Typhoeus.post("#{ENV['EMAIL_BACKEND_DOMAIN']}/email.json", body: email_params)

    contact_id = params[:id]

    if (response.code >= 400 || response.code == 0)
      flash[:alert] = "Sorry, the email could not be sent at this time"
      redirect_to email_contacts_path(contact_id)
    else
      redirect_to email_sent_path(contact_id)
    end
  end

  def sent_email
    # A response page that shows that the user's email got sent
  end

  private

  def load_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address, :photo)
  end

  def email_params
    params.require(:email).permit(:email, :subject, :body)
  end
end
