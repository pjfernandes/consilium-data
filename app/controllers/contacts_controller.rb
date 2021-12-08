class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to contacts_path, notice: 'Your message was sent.'
    else
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message, :ip, :latitude, :longitude)
  end

end
