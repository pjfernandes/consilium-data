class Contact < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i }
  validates :message, presence: true, length: { minimum: 10 }
end
