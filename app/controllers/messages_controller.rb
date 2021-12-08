class MessagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :new, :create ]

   def index
    if current_user.admin?
      @messages = Message.all
    else
      redirect_to root_path
    end
  end

  def show
    if current_user.admin?
      @message = Message.find(params[:id])
    else
      redirect_to root_path
    end
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: 'Your message was sent.'
    else
      render :new
    end
  end



  private
  def message_params
    params.require(:message).permit(:id, :name, :email, :message, :ip, :latitude, :longitude)
  end

end
