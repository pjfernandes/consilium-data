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
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Thank you for your message. We will contact you soon!'
      #redirect_to root_path
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end

  private
  def contact_params
    params.require(:contact).permit(:name, :email, :message, :ip, :latitude, :longitude)
  end

end
