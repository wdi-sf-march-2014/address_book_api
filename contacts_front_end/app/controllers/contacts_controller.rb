class ContactsController < ApplicationController
  before_action :load_contact, except: [:index, :new, :create]

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
    @email = Email.new
  end

  def send_email
    email = Email.create(email_params.slice(:contact_id, :subject, :message))
    response = Typhoeus.post("localhost:3000/email.json", params: {email: params[:email]})
    redirect_to email_sent_path, notice: 'Emails may take a while to send. If you do not see a confirmation for your most recent email immediately, please check back in a few minutes.'
  end

  def sent_email
  end

private

  def load_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address, :photo)
  end

  def email_params
    params.require(:email).permit(:contact_id, :to, :subject, :message)
  end

end
