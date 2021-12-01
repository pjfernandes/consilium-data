class Contact < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  #attribute :nickname,  :captcha  => true
  #append :remote_ip, :user_agent, :session

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      :subject => "My Contact Form",
      :to => "pj_fernandes@id.uff.br",
      :from => %("#{name}" <#{email}>)
    }
  end
end
