class UserMailer < ApplicationMailer
  def confirmation
    @user = User.all.first
    mail to: @user.email, subject: "Consilium Data post"
  end
end
