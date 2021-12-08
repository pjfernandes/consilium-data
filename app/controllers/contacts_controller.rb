class ContactsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

   def index
    if current_user.admin?
      @contacts = Contact.all
    else
      redirect_to root_path
    end
  end

  def show
    if current_user.admin?
      @contact = Contact.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to root_path, notice: 'Your message was sent.'
    else
      render :new
    end

  end



  private
  def contact_params
    params.require(:contact).permit(:id, :name, :email, :message, :ip, :latitude, :longitude)
  end

end
