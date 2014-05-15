class ContactsController < ApplicationController
  before_action :load_contact, only: [:show, :edit, :update, :destroy]

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
    @contact = Contact.find(params[:id])
  end

  def send_email
    Typhoeus.post("http://localhost:3001/email.json", params: ["email", "subject"])
    redirect_to email_sent_path
  end

  def sent_email
    email_sent_path
  end

  private

  def load_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :phone, :address, :photo, :subject, :body)
  end
end
